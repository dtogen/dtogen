import 'dart:convert';
import 'dart:io';

import 'package:dtogen/dtogen.dart';
import 'package:dtogen_cli/args_parser.dart';
import 'package:dtogen_cli/output_generator.dart';
import 'package:dtogen_shared/dtogen_storage.dart';

Future<void> runDtoGenCli(List<String> arguments) async {
  final argsParser = describeArguments();
  final parsedArgs = argsParser.parse(arguments);

  if (parsedArgs[help] || arguments.isEmpty) {
    print(
      """
A command-line app which is used to generate DTOs and Entities from json.

Usage: dtogen [arguments]

Options:
${argsParser.usage}""",
    );
    return;
  }

  final String? pathToJson = parsedArgs[input];
  if (pathToJson == null) {
    throw Exception("Path to the JSON file must be specified");
  }
  final generateEntity = !parsedArgs[noEntity];
  final shouldSplitByFiles = parsedArgs[splitByFiles];
  final String? pathToOutput = parsedArgs[output];
  final fileWithJson = File(pathToJson);

  if (!await fileWithJson.exists()) {
    print(fileWithJson.absolute.path);
    print("Given file $pathToJson doesn't exist");
    exit(1);
  } else {
    final jsonString = await fileWithJson.readAsString();
    final json = jsonDecode(jsonString);
    if (json is! Json) {
      print(
        "Json's top-level structure supposed to be a Map but given is ${json.runtimeType}",
      );
      exit(1);
    }

    final settings = CodeGenerationSettings(
      modelTypesToGenerate: {
        if (generateEntity) ModelType.entity,
        ModelType.dto,
      },
      splitByFiles: shouldSplitByFiles,
      generateToJson: parsedArgs[noToJson] != true,
      generateFromJson: parsedArgs[noFromJson] != true,
      addCopyWith: parsedArgs[noCopy] != true,
      addEquatable: true,
      prefixName: parsedArgs[prefix],
    );

    final generator = Generator(
      tokenGenerators: [
        if (settings.generateDtos)
          DtoTokenGenerator(
            settings: const DtoGenerationSettings(
              generateFromJson: true,
              generateToJson: true,
            ),
            addImports: settings.splitByFiles == true,
            generateEntityMappers: settings.generateEntities,
          ),
        if (settings.generateEntities)
          EntityTokenGenerator(
            settings: const EntityGenerationSettings(
              addCopyWith: true,
              addEquatable: true,
            ),
            addImports: settings.splitByFiles == true,
          ),
      ],
    );
    final parser = JsonDartClassParser(
      settings: JsonParserSettings(prefixName: settings.prefixName),
    );
    final generateResult = generator.generateCode(parser.parse(json));
    final outputGenerator = OutputGenerator(
      generatedModelsResult: generateResult,
      splitByFiles: shouldSplitByFiles,
      pathToOutput: pathToOutput,
    );
    return outputGenerator.generateOutput();
  }
}
