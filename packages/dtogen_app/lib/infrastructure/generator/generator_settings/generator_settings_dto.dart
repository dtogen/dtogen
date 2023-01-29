import 'package:dtogen_app/domain/generator/generator_settings/generator_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_settings_dto.g.dart';

@JsonSerializable()
class GeneratorSettingsDto {
  const GeneratorSettingsDto({
    required this.generateFromJson,
    required this.generateToJson,
    required this.addHiveToDto,
    required this.generateEntity,
    required this.generateEquatable,
    required this.generateCopyWith,
    required this.addHiveToEntity,
    required this.generateImports,
    required this.prefix,
  });

  factory GeneratorSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$GeneratorSettingsDtoFromJson(json);

  factory GeneratorSettingsDto.fromEntity(GeneratorSettings entity) {
    return GeneratorSettingsDto(
      generateFromJson: entity.generateFromJson,
      generateToJson: entity.generateToJson,
      addHiveToDto: entity.addHiveToDto,
      generateEntity: entity.generateEntity,
      generateEquatable: entity.generateEquatable,
      generateCopyWith: entity.generateCopyWith,
      addHiveToEntity: entity.addHiveToEntity,
      generateImports: entity.generateImports,
      prefix: entity.prefix,
    );
  }

  final bool generateFromJson;
  final bool generateToJson;
  final bool addHiveToDto;
  final bool generateEntity;
  final bool generateEquatable;
  final bool generateCopyWith;
  final bool addHiveToEntity;
  final bool generateImports;
  final String? prefix;

  GeneratorSettings toEntity() {
    return GeneratorSettings(
      generateFromJson: generateFromJson,
      generateToJson: generateToJson,
      generateEntity: generateEntity,
      addHiveToDto: addHiveToDto,
      generateEquatable: generateEquatable,
      generateCopyWith: generateCopyWith,
      addHiveToEntity: addHiveToEntity,
      generateImports: generateImports,
      prefix: prefix,
    );
  }

  Map<String, dynamic> toJson() => _$GeneratorSettingsDtoToJson(this);
}
