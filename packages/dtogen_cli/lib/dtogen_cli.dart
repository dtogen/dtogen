import 'package:dtogen_cli/args_parser.dart';
import 'package:dtogen_cli/generator_runner.dart';
import 'package:dtogen_cli/settings_updater.dart';
import 'package:dtogen_shared/dtogen_storage.dart';

Future<void> runDtoGenCli(List<String> arguments) async {
  final settingsRepository = CodeGenerationSettingsRepository();
  await settingsRepository.initialize();
  final defaultSettingsResult = await settingsRepository.getSettings();
  if (defaultSettingsResult.isLeft()) {
    print('Failed to load default settings');
  }
  final defaultSettings = defaultSettingsResult.toOption().toNullable();
  final argsParser = DtogenCliArgs.describeArguments(
    defaultSettings ?? CodeGenerationSettings(),
  );
  final parsedArgs = argsParser.parse(arguments);

  if (parsedArgs.command?.name == 'settings') {
    await updateSettings(
      args: parsedArgs.command!,
      settingsRepository: settingsRepository,
      argsParser: argsParser,
    );
  } else {
    await runGenerator(
      args: parsedArgs,
      defaultSettings: defaultSettings,
      argsParser: argsParser,
    );
  }
}
