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
    return [
      if (addImports) DartToken.import(path: 'package:json_serializable/json_serializable.dart'),
      DartToken.classDeclaration(
        name: name,
        annotations: [
          AnnotationToken(name: 'JsonSerializable(${jsonSerializableArgs.join(', ')})'),
        ],
        fields: [
          for (final field in dartClass.fields)
            FieldToken(
              name: field.name,
              type: ReferenceToken(name: field.typeName),
              isNullable: field.isNullable,
            ),
        ],
        factories: [
          if (generateFromJson)
            FactoryToken(
              name: 'fromJson',
              parameters: [
                FieldToken(name: 'json', type: ReferenceToken(name: 'Map<String, dynamic>')),
              ],
              isLambda: true,
              methodText: '_\$${name}FromJson(json)',
            ),
          if (generateFromEntity)
            FactoryToken(
              name: 'fromEntity',
              parameters: [
                FieldToken(name: 'entity', type: ReferenceToken(name: dartClass.name)),
              ],
              isLambda: false,
              methodText: 'return $name(${dartClass.fields.map(_fromEntityFieldMapper).join(', ')},);',
            ),
        ],
        methods: [
          if (generateToJson)
            MethodToken(
              returnType: ReferenceToken(name: 'Map<String, dynamic>'),
              name: 'toJson',
              isLambda: true,
              methodText: '_\$${name}ToJson(this)',
            ),
          if (generateEntityMappers && generateToEntity)
            MethodToken(
              returnType: ReferenceToken(name: dartClass.name),
              name: 'toEntity',
              isLambda: false,
              methodText: 'return ${dartClass.name}(${dartClass.fields.map(_toEntityFieldMapper).join(', ')},);',
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
      dateTime: () {
        final nullCheckPrefix = field.isNullable ? '${field.name} == null ? null : ' : '';
        return '${field.name}: ${nullCheckPrefix}DateTime.parse(${field.name})';
      },
      list: (type) {
        return type.maybeWhen(
          custom: (_) => '${field.name}: ${field.name}$methodNullAware.map((e) => e.toEntity()).toList()',
          dateTime: () => '${field.name}: ${field.name}$methodNullAware.map(DateTime.parse).toList()',
          orElse: () => '${field.name}: ${field.name}',
        );
      },
    );
  }

  String _fromEntityFieldMapper(DartClassField field) {
    final entityField = 'entity.${field.name}';
    final methodNullAware = field.isNullable ? '?' : '';
    final nullCheckPrefix = field.isNullable ? '$entityField == null ? null : ' : '';
    return field.typeInfo.when(
      primitive: () => '${field.name}: $entityField',
      custom: (_) {
        var customFieldMapper = '${field.typeName}Dto.fromEntity($entityField)';
        if (field.isNullable) {
          return '${field.name}: $nullCheckPrefix${field.typeName}Dto.fromEntity($entityField!)';
        }
        return '${field.name}: $customFieldMapper';
      },
      dateTime: () => '${field.name}: $entityField$methodNullAware.toString()',
      list: (type) {
        return type.maybeWhen(
          custom: (typeName) => '${field.name}: $entityField$methodNullAware.map(${typeName}Dto.fromEntity).toList()',
          dateTime: () => '${field.name}: $entityField$methodNullAware.map((e) => t.toString()).toList()',
          orElse: () => '${field.name}: $entityField',
        );
      },
    );
  }
}
