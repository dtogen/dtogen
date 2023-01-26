import 'package:args/args.dart';
import 'package:dtogen_cli/args_parser.dart';
import 'package:dtogen_shared/dtogen_storage.dart';

Future<void> updateSettings({
  required ArgResults args,
  required ICodeGenerationSettingsRepository settingsRepository,
  required DtogenCliArgs argsParser,
}) async {
  if (args[DtogenCliArgs.help] == true) {
    print(argsParser.createHelp());
    return;
  }

  final settings = args.toSettings();
  settingsRepository.saveSettings(settings);
  print('Settings are saved');
}
