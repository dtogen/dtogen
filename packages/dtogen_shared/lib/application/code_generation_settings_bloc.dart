import 'package:bloc/bloc.dart';
import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:dtogen_shared/domain/code_generation_settings.dart';
import 'package:dtogen_shared/domain/i_code_generation_settings_repository.dart';

part 'code_generation_settings_bloc_part.dart';

class CodeGenerationSettingsBloc extends Bloc<CodeGenerationSettingsEvent, CodeGenerationSettingsState> {
  CodeGenerationSettingsBloc(this._repository) : super(const CodeGenerationSettingsState.initial()) {
    on<_LoadSettings>(_onLoadSettings);
    on<_UpdateSettings>(_onUpdateSettings);
  }

  final ICodeGenerationSettingsRepository _repository;

  Future<void> _onLoadSettings(_LoadSettings _, _Emitter emit) async {
    emit(const CodeGenerationSettingsState.inProgress());
    final result = await _repository.getSettings();
    emit(
      result.fold(
        CodeGenerationSettingsState.failure,
        CodeGenerationSettingsState.success,
      ),
    );
  }

  Future<void> _onUpdateSettings(_UpdateSettings event, _Emitter emit) async {
    emit(const CodeGenerationSettingsState.inProgress());
    final result = await _repository.saveSettings(event.settings);
    emit(
      result.match(
        CodeGenerationSettingsState.failure,
        () => const CodeGenerationSettingsState.success(null),
      ),
    );
  }
}

abstract class CodeGenerationSettingsEvent {
  const factory CodeGenerationSettingsEvent.updateSettings(CodeGenerationSettings? settings) = _UpdateSettings;
  const factory CodeGenerationSettingsEvent.loadSettings() = _LoadSettings;
}

typedef CodeGenerationSettingsState = IActionBlocState<CodeGenerationSettings?, Object>;
