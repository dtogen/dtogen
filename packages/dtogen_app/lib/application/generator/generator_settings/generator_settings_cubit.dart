// ignore_for_file: avoid_positional_boolean_parameters

import 'package:dtogen_app/domain/generator/generator_settings/generator_settings_entity.dart';
import 'package:dtogen_app/infrastructure/generator/generator_settings/generator_settings_dto.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class GeneratorSettingsCubit extends HydratedCubit<GeneratorSettings> {
  GeneratorSettingsCubit() : super(GeneratorSettings.defaults());

  void setGenerateFromJson(bool value) {
    emit(state.copyWith.generateFromJson(value));
  }

  void setGenerateToJson(bool value) {
    emit(state.copyWith.generateToJson(value));
  }

  void setGenerateEntity(bool value) {
    emit(state.copyWith.generateEntity(value));
  }

  void setGenerateEquatable(bool value) {
    emit(state.copyWith.generateEquatable(value));
  }

  void setGenerateCopyWith(bool value) {
    emit(state.copyWith.generateCopyWith(value));
  }

  void setGenerateImports(bool value) {
    emit(state.copyWith.generateImports(value));
  }

  void setPrefix(String? value) {
    emit(state.copyWith.prefix(value));
  }

  void setAddHiveToDto(bool value) {
    emit(state.copyWith.addHiveToDto(value));
  }

  void setAddHiveToEntity(bool value) {
    emit(state.copyWith.addHiveToEntity(value));
  }

  @override
  GeneratorSettings? fromJson(Map<String, dynamic> json) {
    return GeneratorSettingsDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic>? toJson(GeneratorSettings state) {
    return GeneratorSettingsDto.fromEntity(state).toJson();
  }
}
