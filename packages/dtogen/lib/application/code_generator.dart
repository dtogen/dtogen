import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dtogen/models/dart_token.dart';

class CodeGenerator {
  const CodeGenerator();

  String generate(List<DartToken> tokens) {
    final library = Library((libraryBuilder) {
      for (final token in tokens) {
        token.map(
          classDeclaration: (classDeclaration) {
            libraryBuilder.body.add(
              Class((classBuilder) {
                classBuilder
                  ..name = classDeclaration.name
                  ..extend = classDeclaration.extend?.toReference()
                  ..annotations
                      .addAll(classDeclaration.annotations.toExpressions())
                  ..methods.addAll(classDeclaration.methods.toMethods())
                  ..fields.addAll(classDeclaration.fields.toFields())
                  ..constructors.addAll([
                    ConstructorMapper.fromFields(classDeclaration.fields),
                    ...classDeclaration.factories.toConstructors()
                  ]);
              }),
            );
          },
          import: (import) {
            libraryBuilder.body.add(
              import.type.when(
                import: () => Directive.import(import.path),
                part: () => Directive.part(import.path),
                partOf: () => Directive.partOf(import.path),
              ),
            );
          },
        );
      }
    });
    final generatedCode = library.accept(_CustomClassEmitter()).toString();

    return DartFormatter().format(generatedCode);
  }
}

extension on List<AnnotationToken> {
  Iterable<Expression> toExpressions() => map((a) => refer(a.name));
}

extension on List<FieldToken> {
  Iterable<Field> toFields() => map(
        (f) => Field((fieldBuilder) {
          fieldBuilder
            ..name = f.name
            ..type = refer('${f.type.name}${f.isNullable ? '?' : ''}')
            ..modifier = FieldModifier.final$
            ..annotations.addAll(f.annotations.toExpressions());
        }),
      );

  Iterable<Parameter> toParameters() => map((field) => field.toParameter());
}

extension on FieldToken {
  Parameter toParameter({bool isRequired = true, bool toThis = true}) {
    return Parameter(
      (parameterBuilder) {
        parameterBuilder
          ..name = name
          ..named = true
          ..type = toThis ? null : type.toReference()
          ..required = isRequired
          ..toThis = toThis;
      },
    );
  }
}

extension on ReferenceToken {
  Reference toReference() => Reference(name, path);
}

extension on MethodTokenType {
  MethodType? toMethodType() => when(
        getter: () => MethodType.getter,
        setter: () => MethodType.setter,
        method: () => null,
      );
}

extension on List<MethodToken> {
  Iterable<Method> toMethods() => map(
        (e) => Method((methodBuilder) {
          methodBuilder
            ..annotations.addAll(e.annotations.toExpressions())
            ..returns = e.returnType.toReference()
            ..type = e.type.toMethodType()
            ..name = e.name
            ..requiredParameters.addAll(e.parameters.toParameters())
            ..lambda = e.isLambda
            ..body = Code(e.methodText);
        }),
      );
}

extension ConstructorMapper on List<FactoryToken> {
  static Constructor fromFields(List<FieldToken> fields) {
    return Constructor((constructorBuilder) {
      constructorBuilder
        ..constant = true
        ..optionalParameters.addAll(fields.toParameters());
    });
  }

  Iterable<Constructor> toConstructors() => map(
        (e) => Constructor((constructorBuilder) {
          constructorBuilder
            ..factory = true
            ..name = e.name
            ..annotations.addAll(e.annotations.toExpressions())
            ..requiredParameters.addAll(
              e.parameters.map(
                (e) => e.toParameter(isRequired: false, toThis: false),
              ),
            )
            ..lambda = e.isLambda
            ..body = Code(e.methodText);
        }),
      );
}

/// Overrides [DartEmitter.visitClass] so that it:
/// 1. Doesn't add empty lines between class fields.
/// 2. Adds empty lines between class methods.
class _CustomClassEmitter extends DartEmitter {
  _CustomClassEmitter() : super(useNullSafetySyntax: true);

  @override
  StringSink visitClass(Class spec, [StringSink? output]) {
    final out = output ??= StringBuffer();
    spec.docs.forEach(out.writeln);
    for (final a in spec.annotations) {
      visitAnnotation(a, out);
    }
    if (spec.abstract) {
      out.write('abstract ');
    }
    out.write('class ${spec.name}');
    visitTypeParameters(spec.types.map((r) => r.type), out);
    if (spec.extend != null) {
      out.write(' extends ');
      spec.extend!.type.accept(this, out);
    }
    if (spec.mixins.isNotEmpty) {
      out
        ..write(' with ')
        ..writeAll(
          spec.mixins.map<StringSink>((m) => m.type.accept(this)),
          ',',
        );
    }
    if (spec.implements.isNotEmpty) {
      out
        ..write(' implements ')
        ..writeAll(
          spec.implements.map<StringSink>((m) => m.type.accept(this)),
          ',',
        );
    }
    out.write(' {');
    for (final c in spec.constructors) {
      visitConstructor(c, spec.name, out);
      out.writeln();
    }
    for (final f in spec.fields) {
      if (f.annotations.isNotEmpty) {
        out.writeln();
      }
      visitField(f, out);
    }
    out.writeln();

    for (final m in spec.methods) {
      visitMethod(m, out);
      if (_isLambdaMethod(m)) {
        out
          ..writeln(';')
          ..writeln();
      }
    }
    out.writeln(' }');
    return out;
  }

  static bool _isLambdaBody(Code? code) =>
      code is ToCodeExpression && !code.isStatement;

  /// Whether the provided [method] is considered a lambda method.
  static bool _isLambdaMethod(Method method) =>
      method.lambda ?? _isLambdaBody(method.body);
}
