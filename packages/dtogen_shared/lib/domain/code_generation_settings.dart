import 'package:dtogen/dtogen.dart';

class CodeGenerationSettings {
  const CodeGenerationSettings({
    this.modelTypesToGenerate = const {},
    this.splitByFiles,
    this.generateToJson,
    this.generateFromJson,
    this.addCopyWith,
    this.addEquatable,
    this.prefixName,
    this.addDtoHiveAnnotation,
    this.addEntityHiveAnnotation,
  });

  final Set<ModelType> modelTypesToGenerate;
  final bool? splitByFiles;
  final bool? generateToJson;
  final bool? generateFromJson;
  final bool? addCopyWith;
  final bool? addEquatable;
  final String? prefixName;
  final bool? addEntityHiveAnnotation;
  final bool? addDtoHiveAnnotation;

  bool get generateDtos => modelTypesToGenerate.contains(ModelType.dto);
  bool get generateEntities => modelTypesToGenerate.contains(ModelType.entity);
  bool get shouldSplitByFiles => splitByFiles == true;

  CodeGenerationSettings copyWith({
    Set<ModelType>? modelTypesToGenerate,
    bool? splitByFiles,
    bool? generateToJson,
    bool? generateFromJson,
    bool? addCopyWith,
    bool? addEquatable,
    String? prefixName,
    bool? addDtoHiveAnnotation,
    bool? addEntityHiveAnnotation,
  }) {
    return CodeGenerationSettings(
      modelTypesToGenerate: modelTypesToGenerate ?? this.modelTypesToGenerate,
      splitByFiles: splitByFiles ?? this.splitByFiles,
      generateToJson: generateToJson ?? this.generateToJson,
      generateFromJson: generateFromJson ?? this.generateFromJson,
      addCopyWith: addCopyWith ?? this.addCopyWith,
      addEquatable: addEquatable ?? this.addEquatable,
      prefixName: prefixName ?? this.prefixName,
      addDtoHiveAnnotation: addDtoHiveAnnotation ?? this.addDtoHiveAnnotation,
      addEntityHiveAnnotation: addEntityHiveAnnotation ?? this.addEntityHiveAnnotation,
    );
  }

  CodeGenerationSettings merge(CodeGenerationSettings other) {
    return copyWith(
      modelTypesToGenerate: modelTypesToGenerate.union(other.modelTypesToGenerate),
      splitByFiles: other.splitByFiles,
      generateToJson: other.generateToJson,
      generateFromJson: other.generateFromJson,
      addCopyWith: other.addCopyWith,
      addEquatable: other.addEquatable,
      prefixName: other.prefixName,
      addDtoHiveAnnotation: other.addDtoHiveAnnotation,
      addEntityHiveAnnotation: other.addEntityHiveAnnotation,
    );
  }

  DtoGenerationSettings toDtoGenerationSettings() {
    return DtoGenerationSettings(
      generateFromJson: generateFromJson == true,
      generateToJson: generateToJson == true,
      generateHiveAnnotations: addDtoHiveAnnotation == true,
    );
  }

  EntityGenerationSettings toEntityGenerationSettings() {
    return EntityGenerationSettings(
      addCopyWith: addCopyWith == true,
      addEquatable: addEquatable == true,
      addHiveAnnotations: addEntityHiveAnnotation == true,
    );
  }

  JsonParserSettings toJsonParserSettings() {
    return JsonParserSettings(
      prefixName: prefixName,
    );
  }
}
