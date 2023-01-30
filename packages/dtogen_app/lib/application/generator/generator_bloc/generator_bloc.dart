import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dtogen/dtogen.dart';
import 'package:dtogen_app/domain/generator/generator_settings/generator_settings_entity.dart';
import 'package:dtogen_shared/dtogen_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generator_event.dart';
part 'generator_state.dart';
part 'generator_bloc.freezed.dart';

class GeneratorBloc extends Bloc<GeneratorEvent, GeneratorState> {
  GeneratorBloc() : super(const GeneratorState.initial()) {
    on<_SettingsUpdated>(_handleSettingsUpdated);
    on<_GenerationRequested>(_handleGenerationRequested);
  }

  GeneratorSettings _settings = GeneratorSettings.defaults();

  void _handleSettingsUpdated(
    _SettingsUpdated event,
    Emitter<GeneratorState> emit,
  ) {
    _settings = event.settings;
  }

  void _handleGenerationRequested(
    _GenerationRequested event,
    Emitter<GeneratorState> emit,
  ) {
    final result = _generateCode(event.input);
    result.fold(
      (failure) => emit(GeneratorState.failed(failure: failure)),
      (generatedModels) {
        final code = generatedModels.map((e) => e.code).join("\n");

        emit(GeneratorState.generated(output: code));
      },
    );
  }

  Either<Object, List<GeneratedModel>> _generateCode(String input) {
    Map<String, dynamic> json;
    try {
      json = jsonDecode(input);
    } catch (e) {
      return Left(e);
    }

    final codeGenerationSettings = _settings.toCodeGenerationSettings();
    final generator = codeGenerationSettings.createGeneratorFromSettings();
    final parser = JsonDartClassParser(
      settings: codeGenerationSettings.toJsonParserSettings(),
    );
    final generationResult = generator.generateCode(parser.parse(json));

    return Right(generationResult);
  }
}
