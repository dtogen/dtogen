import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:dtogen_storage/domain/i_code_generation_settings_repository.dart';
import 'package:dtogen_storage/domain/code_generation_settings.dart';

part 'code_generation_settings_bloc_part.dart';

class CodeGenerationSettingsBloc extends Bloc<CodeGenerationSettingsEvent, CodeGenerationSettingsState> {
  CodeGenerationSettingsBloc(this._repository) : super(const CodeGenerationSettingsState.initial()) {
    on<_LoadSettings>(_onLoadSettings);
    on<_UpdateSettings>(_onUpdateSettings);
  }

  final ICodeGenerationSettingsRepository _repository;

  void _onLoadSettings(_LoadSettings _, _Emitter emit) async {
    emit(CodeGenerationSettingsState.inProgress());
    final result = await _repository.getSettings();
    emit(result.fold(
      CodeGenerationSettingsState.failure,
      CodeGenerationSettingsState.success,
    ));
  }

  void _onUpdateSettings(_UpdateSettings event, _Emitter emit) async {
    emit(CodeGenerationSettingsState.inProgress());
    final result = await _repository.saveSettings(event.settings);
    emit(result.match(
      CodeGenerationSettingsState.failure,
      () => const CodeGenerationSettingsState.success(null),
    ));
  }
}

abstract class CodeGenerationSettingsEvent {
  const factory CodeGenerationSettingsEvent.updateSettings(CodeGenerationSettings? settings) = _UpdateSettings;
  const factory CodeGenerationSettingsEvent.loadSettings() = _LoadSettings;
}

typedef CodeGenerationSettingsState = IActionBlocState<CodeGenerationSettings?, Object>;
