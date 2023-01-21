import 'package:dtogen/models/generated_model.dart';

class CodeGenerationSettings {
  const CodeGenerationSettings({
    required this.modelTypesToGenerate,
    required this.splitByFiles,
  });

  final Set<ModelType> modelTypesToGenerate;
  final bool splitByFiles;

  bool get generateDtos => modelTypesToGenerate.contains(ModelType.dto);
  bool get generateEntities => modelTypesToGenerate.contains(ModelType.entity);
}
