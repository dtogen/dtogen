part of 'generator_bloc.dart';

@immutable
abstract class GeneratorEvent {
  const factory GeneratorEvent.settingsUpdated(GeneratorSettings settings) =
      _SettingsUpdated;

  const factory GeneratorEvent.generationRequested(String input) =
      _GenerationRequested;
}

class _SettingsUpdated implements GeneratorEvent {
  const _SettingsUpdated(this.settings);

  final GeneratorSettings settings;
}

class _GenerationRequested implements GeneratorEvent {
  const _GenerationRequested(this.input);

  final String input;
}
