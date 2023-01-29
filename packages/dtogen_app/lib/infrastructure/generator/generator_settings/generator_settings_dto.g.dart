// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratorSettingsDto _$GeneratorSettingsDtoFromJson(
        Map<String, dynamic> json) =>
    GeneratorSettingsDto(
      generateFromJson: json['generateFromJson'] as bool,
      generateToJson: json['generateToJson'] as bool,
      addHiveToDto: json['addHiveToDto'] as bool,
      generateEntity: json['generateEntity'] as bool,
      generateEquatable: json['generateEquatable'] as bool,
      generateCopyWith: json['generateCopyWith'] as bool,
      addHiveToEntity: json['addHiveToEntity'] as bool,
      generateImports: json['generateImports'] as bool,
      prefix: json['prefix'] as String?,
    );

Map<String, dynamic> _$GeneratorSettingsDtoToJson(
        GeneratorSettingsDto instance) =>
    <String, dynamic>{
      'generateFromJson': instance.generateFromJson,
      'generateToJson': instance.generateToJson,
      'addHiveToDto': instance.addHiveToDto,
      'generateEntity': instance.generateEntity,
      'generateEquatable': instance.generateEquatable,
      'generateCopyWith': instance.generateCopyWith,
      'addHiveToEntity': instance.addHiveToEntity,
      'generateImports': instance.generateImports,
      'prefix': instance.prefix,
    };
