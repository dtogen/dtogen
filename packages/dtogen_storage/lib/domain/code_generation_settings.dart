import 'package:dtogen/dtogen.dart';

class CodeGenerationSettings {
  const CodeGenerationSettings({
    required this.modelTypesToGenerate,
    required this.splitByFiles,
    required this.generateToJson,
    required this.generateFromJson,
    required this.addCopyWith,
    required this.addEquatable,
    required this.prefixName,
  });

  final Set<ModelType> modelTypesToGenerate;
  final bool? splitByFiles;
  final bool? generateToJson;
  final bool? generateFromJson;
  final bool? addCopyWith;
  final bool? addEquatable;
  final String? prefixName;

  bool get generateDtos => modelTypesToGenerate.contains(ModelType.dto);
  bool get generateEntities => modelTypesToGenerate.contains(ModelType.entity);

  CodeGenerationSettings copyWith({
    Set<ModelType>? modelTypesToGenerate,
    bool? splitByFiles,
    bool? generateToJson,
    bool? generateFromJson,
    bool? addCopyWith,
    bool? addEquatable,
    String? prefixName,
  }) {
    return CodeGenerationSettings(
      modelTypesToGenerate: modelTypesToGenerate ?? this.modelTypesToGenerate,
      splitByFiles: splitByFiles ?? this.splitByFiles,
      generateToJson: generateToJson ?? this.generateToJson,
      generateFromJson: generateFromJson ?? this.generateFromJson,
      addCopyWith: addCopyWith ?? this.addCopyWith,
      addEquatable: addEquatable ?? this.addEquatable,
      prefixName: prefixName ?? this.prefixName,
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
    );
  }
}
