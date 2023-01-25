import 'dart:io';

import 'package:dtogen/dtogen.dart';
import 'package:path/path.dart';

class OutputGenerator {
  const OutputGenerator({
    required this.generatedModelsResult,
    required this.pathToOutput,
    required this.splitByFiles,
  });

  final List<GeneratedModel> generatedModelsResult;
  final String? pathToOutput;
  final bool splitByFiles;

  Future<void> generateOutput() async {
    final pathToOutput = this.pathToOutput;
    if (!splitByFiles) {
      final generatedClasses = generatedModelsResult.map((e) => e.code).join("\n");

      if (pathToOutput != null) {
        await File(pathToOutput).writeAsString(generatedClasses);
      } else {
        print(generatedClasses);
      }
    } else {
      final outputPath = join(Directory.current.path, pathToOutput ?? "output");

      await _writeClassesToDirectory(
        directoryPath: join(outputPath, "dtos"),
        classGenerators: generatedModelsResult.where((element) => element.type.isDto).toList(),
      );
      await _writeClassesToDirectory(
        directoryPath: join(outputPath, "entities"),
        classGenerators: generatedModelsResult.where((element) => element.type.isEntity).toList(),
      );
    }
  }

  Future<void> _writeClassesToDirectory({
    required String directoryPath,
    required List<GeneratedModel> classGenerators,
  }) async {
    await Directory(directoryPath).create(recursive: true);
    for (final model in classGenerators) {
      final outputFile = File(join(directoryPath, model.fileName));
      await outputFile.writeAsString(model.code);
    }
  }
}
