import 'package:dtogen/application/i_token_generator.dart';
import 'package:dtogen/models/dart_token.dart';
import 'package:dtogen/models/dart_class.dart';
import 'package:dtogen/models/entity_generation_settings.dart';
import 'package:dtogen/models/generated_model.dart';

class EntityTokenGenerator extends ITokenGenerator {
  EntityTokenGenerator({
    required this.settings,
    required super.addImports,
  }) : super(modelGeneratorType: ModelType.entity);

  final EntityGenerationSettings settings;

  @override
  List<DartToken> generateTokens(DartClass dartClass) {
    final addEquatable = settings.addEquatable;
    final addCopyWith = settings.addCopyWith;
    return [
      if (addImports && addCopyWith) DartToken.import(path: 'package:copy_with/copy_with.dart'),
      if (addImports && addEquatable) DartToken.import(path: 'package:equatable/equatable.dart'),
      DartToken.classDeclaration(
        name: dartClass.name,
        annotations: [
          if (addCopyWith) AnnotationToken(name: 'CopyWith()'),
        ],
        extend: addEquatable ? ReferenceToken(name: 'Equatable') : null,
        fields: [
          for (final field in dartClass.fields)
            FieldToken(
              name: field.name,
              type: ReferenceToken(name: field.typeName),
              isNullable: field.isNullable,
            ),
        ],
        methods: [
          if (addEquatable)
            MethodToken(
              annotations: [AnnotationToken(name: 'override')],
              type: MethodTokenType.getter,
              returnType: ReferenceToken(name: 'List<Object?>'),
              name: 'props',
              isLambda: true,
              methodText: '[${dartClass.fields.map((e) => e.name).join(', ')},]',
            ),
        ],
      ),
    ];
  }
}
