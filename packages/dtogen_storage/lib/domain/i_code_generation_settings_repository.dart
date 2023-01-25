import 'dart:async';

import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:dtogen_storage/domain/code_generation_settings.dart';

abstract class ICodeGenerationSettingsRepository {
  Future<void> initialize();

  Future<Either<Object, CodeGenerationSettings?>> getSettings();

  /// Returns option with an error if something went wrong.
  Future<Option<Object>> saveSettings(CodeGenerationSettings? settings);
}
