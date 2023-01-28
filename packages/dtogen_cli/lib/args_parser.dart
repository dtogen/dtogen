import 'package:args/args.dart';
import 'package:dtogen/dtogen.dart';
import 'package:dtogen_shared/dtogen_storage.dart';

class DtogenCliArgs {
  DtogenCliArgs._(this._argParser);
  static const fromJson = "from-json";
  static const toJson = "to-json";
  static const entity = "entity";
  static const noDto = "no-dto";
  static const copyWith = "copy";
  static const hiveEntity = "hive-entity";
  static const hiveDto = "hive-dto";
  static const equatable = 'equatable';
  static const input = "input";
  static const output = "output";
  static const prefix = "prefix";
  static const help = "help";
  static const splitByFiles = "split-by-files";

  final ArgParser _argParser;

  factory DtogenCliArgs.describeArguments(CodeGenerationSettings defaultsTo) {
    final settingsParser = _buildSettingsArgsParser(defaultsTo)..addOption(help, hide: true);
    final parser = _buildSettingsArgsParser(defaultsTo)
      ..addCommand('settings', settingsParser)
      ..addFlag(help, abbr: 'h', hide: true)
      ..addOption(
        input,
        abbr: "i",
        help: "Path to the json file. Json will be copied from the clipboard if not specified",
        mandatory: false,
      )
      ..addOption(
        output,
        abbr: "o",
        help: "Path to the output dart file. Prints to console if not specified",
      );

    return DtogenCliArgs._(parser);
  }

  static ArgParser _buildSettingsArgsParser(CodeGenerationSettings? defaultsTo) {
    return ArgParser()
      ..addFlag(
        entity,
        negatable: false,
        defaultsTo: defaultsTo?.generateEntities,
        help: "Generate Entity for DTO. "
            "Entity can extends `Equatable` and uses `DateTime` instead of `String` with date.\n"
            "Entity is a pure class that doesn't depends on the backend types and structures.\n"
            "It's used in the business logic while dto is only used in the data layer.",
      )
      ..addFlag(
        fromJson,
        negatable: false,
        defaultsTo: defaultsTo?.generateFromJson,
        help: "Generate `fromJson` factory for DTO. Also generates `toEntity` method if `--$entity` is specified",
      )
      ..addFlag(
        toJson,
        negatable: false,
        defaultsTo: defaultsTo?.generateToJson,
        help: "Generate `toJson` method for DTO. Also generates `fromEntity` method if `--$entity` is specified",
      )
      ..addFlag(
        noDto,
        negatable: false,
        defaultsTo: defaultsTo?.generateDtos,
        help: "Do not generate DTO",
      )
      ..addFlag(
        copyWith,
        negatable: false,
        defaultsTo: defaultsTo?.addCopyWith,
        help: "Generate `CopyWith` annotation for entities",
      )
      ..addFlag(
        equatable,
        negatable: false,
        defaultsTo: defaultsTo?.addEquatable,
        help: "Generate entities that extends `Equatable` and overrides `props` getter",
      )
      ..addFlag(
        hiveEntity,
        negatable: false,
        defaultsTo: defaultsTo?.addEntityHiveAnnotation,
        help: "Generate `HiveType` annotation for entities and `HiveField` for fields",
      )
      ..addFlag(
        hiveDto,
        negatable: false,
        defaultsTo: defaultsTo?.addDtoHiveAnnotation,
        help: "Generate `HiveType` annotation for dtos and `HiveField` for fields",
      )
      ..addOption(
        prefix,
        abbr: "p",
        defaultsTo: defaultsTo?.prefixName,
        help: "Prefix for all generated class names",
      )
      ..addFlag(
        splitByFiles,
        abbr: 's',
        negatable: false,
        defaultsTo: defaultsTo?.splitByFiles,
        help: "Create a file for each generated models.\n"
            "Files are stored in the provided by $output option folder.",
      );
  }

  ArgResults parse(List<String> args) => _argParser.parse(args);

  String createHelp() {
    return """
A command-line app which is used to generate DTOs and Entities from json.

Usage: dtogen [arguments]

Commands:
    settings            Set global settings so you don't need to specify them every time

Options:
${_argParser.usage}""";
  }
}

extension ArgsSettingsMapper on ArgResults {
  CodeGenerationSettings toSettings() {
    return CodeGenerationSettings(
      modelTypesToGenerate: {
        if (this[DtogenCliArgs.entity] == true) ModelType.entity,
        if (this[DtogenCliArgs.toJson] == true) ModelType.dto,
      },
      splitByFiles: this[DtogenCliArgs.splitByFiles] == true,
      generateFromJson: this[DtogenCliArgs.fromJson] == true,
      generateToJson: this[DtogenCliArgs.toJson] == true,
      addCopyWith: this[DtogenCliArgs.copyWith] == true,
      addEquatable: this[DtogenCliArgs.equatable] == true,
      addEntityHiveAnnotation: this[DtogenCliArgs.hiveEntity] == true,
      addDtoHiveAnnotation: this[DtogenCliArgs.hiveDto] == true,
      prefixName: this[DtogenCliArgs.prefix],
    );
  }
}
