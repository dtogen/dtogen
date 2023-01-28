import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'generator_settings_entity.g.dart';

@CopyWith()
class GeneratorSettings extends Equatable {
  const GeneratorSettings({
    required this.generateFromJson,
    required this.generateToJson,
    required this.generateEntity,
    required this.generateEquatable,
    required this.generateCopyWith,
    required this.generateImports,
    this.prefix,
  });

  factory GeneratorSettings.defaults() {
    return const GeneratorSettings(
      generateFromJson: true,
      generateToJson: true,
      generateEntity: true,
      generateEquatable: false,
      generateCopyWith: false,
      generateImports: false,
    );
  }

  final bool generateFromJson;
  final bool generateToJson;

  final bool generateEntity;
  final bool generateEquatable;
  final bool generateCopyWith;

  final bool generateImports;
  final String? prefix;

  @override
  List<Object?> get props => [
        generateFromJson,
        generateToJson,
        generateEntity,
        generateEquatable,
        generateCopyWith,
        generateImports,
        prefix,
      ];
}
