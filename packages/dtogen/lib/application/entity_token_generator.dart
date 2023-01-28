import 'package:dtogen/application/i_token_generator.dart';
import 'package:dtogen/models/dart_class.dart';
import 'package:dtogen/models/dart_token.dart';
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
    final fields = dartClass.fields;
    return [
      if (addImports) ...[
        if (addCopyWith) const DartToken.import(path: 'package:copy_with/copy_with.dart'),
        if (addEquatable) const DartToken.import(path: 'package:equatable/equatable.dart'),
        if (settings.addHiveAnnotations) const DartToken.import(path: 'package:hive/hive.dart'),
      ],
      DartToken.classDeclaration(
        name: dartClass.name,
        annotations: [
          if (settings.addHiveAnnotations) const AnnotationToken(name: 'HiveType(typeId: -1)'),
          if (addCopyWith) const AnnotationToken(name: 'CopyWith()'),
        ],
        extend: addEquatable ? const ReferenceToken(name: 'Equatable') : null,
        fields: [
          for (var i = 0; i < fields.length; i++)
            FieldToken(
              name: fields[i].name,
              type: ReferenceToken(name: fields[i].typeName),
              isNullable: fields[i].isNullable,
              annotations: [
                if (settings.addHiveAnnotations) AnnotationToken(name: 'HiveField($i)'),
              ],
            ),
        ],
        methods: [
          if (addEquatable)
            MethodToken(
              annotations: [const AnnotationToken(name: 'override')],
              type: MethodTokenType.getter,
              returnType: const ReferenceToken(name: 'List<Object?>'),
              name: 'props',
              isLambda: true,
              methodText: '[${dartClass.fields.map((e) => e.name).join(', ')},]',
            ),
        ],
      ),
    ];
  }
}
