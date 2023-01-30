part of 'generator_bloc.dart';

@freezed
class GeneratorState with _$GeneratorState {
  const factory GeneratorState.initial() = _Initial;
  const factory GeneratorState.generated({required String output}) = _Generated;
  const factory GeneratorState.failed({required Object failure}) = _Failed;
}
