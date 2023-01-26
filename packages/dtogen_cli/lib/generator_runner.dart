import 'package:args/args.dart';
import 'package:dtogen/dtogen.dart';
import 'package:dtogen_cli/args_parser.dart';
import 'package:dtogen_cli/json_loader.dart';
import 'package:dtogen_cli/output_generator.dart';
import 'package:dtogen_shared/dtogen_storage.dart';

Future<void> runGenerator({
  required ArgResults args,
  required DtogenCliArgs argsParser,
  required CodeGenerationSettings? defaultSettings,
}) async {
  if (args[DtogenCliArgs.help] == true) {
    print(argsParser.createHelp());
    return;
  }

  final String? pathToJson = args[DtogenCliArgs.input];
  final shouldSplitByFiles = args[DtogenCliArgs.splitByFiles] == true;
  final String? pathToOutput = args[DtogenCliArgs.output];
  final json = await loadJson(pathToJson);

  var settings = args.toSettings();
  if (defaultSettings != null) {
    settings = settings.merge(defaultSettings);
  }

  final generator = settings.createGeneratorFromSettings();
  final parser = JsonDartClassParser(
    settings: settings.toJsonParserSettings(),
  );
  final generateResult = generator.generateCode(parser.parse(json));
  final outputGenerator = OutputGenerator(
    generatedModelsResult: generateResult,
    splitByFiles: shouldSplitByFiles,
    pathToOutput: pathToOutput,
  );
  return outputGenerator.generateOutput();
}
