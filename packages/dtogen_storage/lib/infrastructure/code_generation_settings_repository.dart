import 'dart:io';

import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:dtogen_storage/domain/i_code_generation_settings_repository.dart';
import 'package:dtogen_storage/infrastructure/code_generation_settings_adapter.dart';
import 'package:dtogen_storage/domain/code_generation_settings.dart';
import 'package:hive/hive.dart';

class CodeGenerationSettingsRepository extends ICodeGenerationSettingsRepository {
  final _box = Hive.openBox<CodeGenerationSettings>(_key);
  static const _key = 'settings';

  @override
  Future<void> initialize() async {
    Hive
      ..init(Directory.systemTemp.path)
      ..registerAdapter(CodeGenerationSettingsAdapter())
      ..registerAdapter(ModelTypeAdapter());
  }

  @override
  Future<Either<Object, CodeGenerationSettings?>> getSettings() async {
    try {
      final box = await _box;
      final settings = box.get(_key);
      return right(settings);
    } catch (e) {
      return left(e);
    }
  }

  @override
  Future<Option<Object>> saveSettings(CodeGenerationSettings? settings) async {
    try {
      final box = await _box;
      if (settings != null) {
        await box.put(_key, settings);
      } else {
        await box.delete(_key);
      }
      return none();
    } catch (e) {
      return some(e);
    }
  }
}
