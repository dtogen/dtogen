import 'package:dtogen/application/i_token_generator.dart';
import 'package:dtogen/models/dart_class.dart';
import 'package:dtogen/models/dart_token.dart';
import 'package:dtogen/models/dto_generation_settings.dart';
import 'package:dtogen/models/generated_model.dart';

class DtoTokenGenerator extends ITokenGenerator {
  DtoTokenGenerator({
    required this.settings,
    required super.addImports,
    required this.generateEntityMappers,
  }) : super(modelGeneratorType: ModelType.dto);

  final DtoGenerationSettings settings;
  final bool generateEntityMappers;

  @override
  List<DartToken> generateTokens(DartClass dartClass) {
    final generateFromJson = settings.generateFromJson;
    final generateToJson = settings.generateToJson;
    final generateToEntity = generateFromJson;
    final generateFromEntity = generateToJson;
    final jsonSerializableArgs = [
      if (!generateFromJson) 'createFactory: false',
      if (!generateToJson) 'createToJson: false',
    ];
    final name = '${dartClass.name}Dto';
    final fields = dartClass.fields;
    return [
      if (addImports) ...[
        const DartToken.import(
          path: 'package:json_serializable/json_serializable.dart',
        ),
        if (settings.generateHiveAnnotations)
          const DartToken.import(path: 'package:hive/hive.dart'),
      ],
      DartToken.classDeclaration(
        name: name,
        annotations: [
          if (settings.generateHiveAnnotations)
            const AnnotationToken(name: 'HiveType(typeId: -1)'),
          AnnotationToken(
            name: 'JsonSerializable(${jsonSerializableArgs.join(', ')})',
          ),
        ],
        fields: [
          for (var i = 0; i < fields.length; i++)
            FieldToken(
              name: fields[i].name,
              type: ReferenceToken(name: fields[i].typeName),
              annotations: [
                if (settings.generateHiveAnnotations)
                  AnnotationToken(name: 'HiveField($i)'),
              ],
              isNullable: fields[i].isNullable,
            ),
        ],
        factories: [
          if (generateFromJson)
            FactoryToken(
              name: 'fromJson',
              parameters: [
                const FieldToken(
                  name: 'json',
                  type: ReferenceToken(name: 'Map<String, dynamic>'),
                ),
              ],
              isLambda: true,
              methodText: '_\$${name}FromJson(json)',
            ),
          if (generateEntityMappers && generateFromEntity)
            FactoryToken(
              name: 'fromEntity',
              parameters: [
                FieldToken(
                  name: 'entity',
                  type: ReferenceToken(name: dartClass.name),
                ),
              ],
              isLambda: false,
              methodText:
                  'return $name(${dartClass.fields.map(_fromEntityFieldMapper).join(', ')},);',
            ),
        ],
        methods: [
          if (generateToJson)
            MethodToken(
              returnType: const ReferenceToken(name: 'Map<String, dynamic>'),
              name: 'toJson',
              isLambda: true,
              methodText: '_\$${name}ToJson(this)',
            ),
          if (generateEntityMappers && generateToEntity)
            MethodToken(
              returnType: ReferenceToken(name: dartClass.name),
              name: 'toEntity',
              methodText:
                  'return ${dartClass.name}(${dartClass.fields.map(_toEntityFieldMapper).join(', ')},);',
            ),
        ],
      ),
    ];
  }

  String _toEntityFieldMapper(DartClassField field) {
    final methodNullAware = field.isNullable ? '?' : '';
    return field.typeInfo.when(
      primitive: () => '${field.name}: ${field.name}',
      custom: (_) => '${field.name}: ${field.name}$methodNullAware.toEntity()',
      list: (type) {
        return type.maybeWhen(
          custom: (_) =>
              '${field.name}: ${field.name}$methodNullAware.map((e) => e.toEntity()).toList()',
          orElse: () => '${field.name}: ${field.name}',
        );
      },
    );
  }

  String _fromEntityFieldMapper(DartClassField field) {
    final entityField = 'entity.${field.name}';
    final methodNullAware = field.isNullable ? '?' : '';
    final nullCheckPrefix =
        field.isNullable ? '$entityField == null ? null : ' : '';
    return field.typeInfo.when(
      primitive: () => '${field.name}: $entityField',
      custom: (_) {
        final customFieldMapper =
            '${field.typeName}Dto.fromEntity($entityField)';
        if (field.isNullable) {
          return '${field.name}: $nullCheckPrefix${field.typeName}Dto.fromEntity($entityField!)';
        }
        return '${field.name}: $customFieldMapper';
      },
      list: (type) {
        return type.maybeWhen(
          custom: (typeName) =>
              '${field.name}: $entityField$methodNullAware.map(${typeName}Dto.fromEntity).toList()',
          orElse: () => '${field.name}: $entityField',
        );
      },
    );
  }
}
