import 'package:dtogen/dtogen.dart';
import 'package:dtogen_shared/domain/code_generation_settings.dart';
import 'package:hive/hive.dart';

class CodeGenerationSettingsAdapter extends TypeAdapter<CodeGenerationSettings> {
  @override
  int get typeId => 0;

  @override
  CodeGenerationSettings read(BinaryReader reader) {
    return CodeGenerationSettings(
      modelTypesToGenerate: reader.readList().cast<ModelType>().toSet(),
      splitByFiles: reader.read(),
      generateToJson: reader.read(),
      generateFromJson: reader.read(),
      addCopyWith: reader.read(),
      addEquatable: reader.read(),
      prefixName: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, CodeGenerationSettings obj) {
    writer
      ..write(obj.modelTypesToGenerate.toList())
      ..write(obj.splitByFiles)
      ..write(obj.generateToJson)
      ..write(obj.generateFromJson)
      ..write(obj.addCopyWith)
      ..write(obj.addEquatable)
      ..write(obj.prefixName);
  }
}

class ModelTypeAdapter extends TypeAdapter<ModelType> {
  @override
  int get typeId => 1;

  @override
  ModelType read(BinaryReader reader) {
    return ModelType.values[reader.read()];
  }

  @override
  void write(BinaryWriter writer, ModelType obj) {
    writer.write(obj.index);
  }
}
