import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dtogen/dtogen.dart';
import 'package:dtogen_shared/domain/code_generation_settings.dart';
import 'package:equatable/equatable.dart';

part 'generator_settings_entity.g.dart';

@CopyWith()
class GeneratorSettings extends Equatable {
  const GeneratorSettings({
    required this.generateFromJson,
    required this.generateToJson,
    required this.addHiveToDto,
    required this.generateEntity,
    required this.generateEquatable,
    required this.generateCopyWith,
    required this.addHiveToEntity,
    required this.generateImports,
    this.prefix,
  });

  factory GeneratorSettings.defaults() {
    return const GeneratorSettings(
      generateFromJson: true,
      generateToJson: true,
      addHiveToDto: false,
      generateEntity: true,
      generateEquatable: false,
      generateCopyWith: false,
      addHiveToEntity: false,
      generateImports: false,
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

  CodeGenerationSettings toCodeGenerationSettings() {
    return CodeGenerationSettings(
      generateFromJson: generateFromJson,
      generateToJson: generateToJson,
      addCopyWith: generateCopyWith,
      addEquatable: generateEquatable,
      addDtoHiveAnnotation: addHiveToDto,
      addEntityHiveAnnotation: addHiveToEntity,
      modelTypesToGenerate: {
        if (generateFromJson || generateToJson) ModelType.dto,
        if (generateEntity) ModelType.entity,
      },
      prefixName: prefix,
    );
  }

  @override
  List<Object?> get props => [
        generateFromJson,
        generateToJson,
        addHiveToDto,
        generateEntity,
        generateEquatable,
        generateCopyWith,
        addHiveToEntity,
        generateImports,
        prefix,
      ];

  @override
  String toString() {
    return 'GeneratorSettings(generateFromJson: $generateFromJson, '
        'generateToJson: $generateToJson, addHiveToDto: $addHiveToDto, '
        'generateEntity: $generateEntity, generateEquatable: $generateEquatable, '
        'generateCopyWith: $generateCopyWith, addHiveToEntity: $addHiveToEntity, '
        'generateImports: $generateImports, prefix: $prefix)';
  }
}
