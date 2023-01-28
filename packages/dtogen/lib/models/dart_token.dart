import 'package:freezed_annotation/freezed_annotation.dart';

part 'dart_token.freezed.dart';

@freezed
class DartToken with _$DartToken {
  const factory DartToken.classDeclaration({
    required String name,
    required List<FieldToken> fields,
    required List<MethodToken> methods,
    @Default([]) List<FactoryToken> factories,
    @Default([]) List<AnnotationToken> annotations,
    @Default([]) List<String> mixins,
    @Default([]) List<String> interfaces,
    ReferenceToken? extend,
  }) = ClassToken;

  const factory DartToken.import({
    required String path,
    @Default(ImportTokenType.import) ImportTokenType type,
  }) = ImportToken;
}

class ReferenceToken {
  const ReferenceToken({required this.name, this.path});

  final String name;
  final String? path;
}

class AnnotationToken {
  const AnnotationToken({required this.name});

  final String name;
}

class FactoryToken {
  const FactoryToken({
    required this.name,
    required this.methodText,
    required this.isLambda,
    required this.parameters,
    this.annotations = const [],
  });

  final String name;
  final List<AnnotationToken> annotations;
  final List<FieldToken> parameters;
  final bool isLambda;
  final String methodText;
}

class MethodToken {
  const MethodToken({
    required this.returnType,
    required this.name,
    required this.methodText,
    this.type = MethodTokenType.method,
    this.annotations = const [],
    this.parameters = const [],
    this.isLambda = false,
  });

  final List<AnnotationToken> annotations;
  final String name;
  final List<FieldToken> parameters;
  final MethodTokenType type;
  final ReferenceToken returnType;
  final bool isLambda;
  final String methodText;
}

class FieldToken {
  const FieldToken({
    required this.name,
    required this.type,
    this.isNullable = false,
    this.annotations = const [],
  });

  final String name;
  final ReferenceToken type;
  final bool isNullable;
  final List<AnnotationToken> annotations;
}

enum ImportTokenType {
  import,
  part,
  partOf;

  T when<T>({
    required T Function() import,
    required T Function() part,
    required T Function() partOf,
  }) {
    switch (this) {
      case ImportTokenType.import:
        return import();
      case ImportTokenType.part:
        return part();
      case ImportTokenType.partOf:
        return partOf();
    }
  }
}

enum MethodTokenType {
  getter,
  setter,
  method;

  T when<T>({
    required T Function() getter,
    required T Function() setter,
    required T Function() method,
  }) {
    switch (this) {
      case MethodTokenType.getter:
        return getter();
      case MethodTokenType.setter:
        return setter();
      case MethodTokenType.method:
        return method();
    }
  }
}
