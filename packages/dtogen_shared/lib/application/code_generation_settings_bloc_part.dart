part of 'code_generation_settings_bloc.dart';

typedef _Emitter = Emitter<CodeGenerationSettingsState>;

class _UpdateSettings implements CodeGenerationSettingsEvent {
  const _UpdateSettings(this.settings);

  final CodeGenerationSettings? settings;
}

class _LoadSettings implements CodeGenerationSettingsEvent {
  const _LoadSettings();
}
