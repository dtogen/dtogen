// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_settings_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GeneratorSettingsCWProxy {
  GeneratorSettings generateFromJson(bool generateFromJson);

  GeneratorSettings generateToJson(bool generateToJson);

  GeneratorSettings generateEntity(bool generateEntity);

  GeneratorSettings generateEquatable(bool generateEquatable);

  GeneratorSettings generateCopyWith(bool generateCopyWith);

  GeneratorSettings generateImports(bool generateImports);

  GeneratorSettings prefix(String? prefix);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeneratorSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeneratorSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  GeneratorSettings call({
    bool? generateFromJson,
    bool? generateToJson,
    bool? generateEntity,
    bool? generateEquatable,
    bool? generateCopyWith,
    bool? generateImports,
    String? prefix,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeneratorSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeneratorSettings.copyWith.fieldName(...)`
class _$GeneratorSettingsCWProxyImpl implements _$GeneratorSettingsCWProxy {
  const _$GeneratorSettingsCWProxyImpl(this._value);

  final GeneratorSettings _value;

  @override
  GeneratorSettings generateFromJson(bool generateFromJson) =>
      this(generateFromJson: generateFromJson);

  @override
  GeneratorSettings generateToJson(bool generateToJson) =>
      this(generateToJson: generateToJson);

  @override
  GeneratorSettings generateEntity(bool generateEntity) =>
      this(generateEntity: generateEntity);

  @override
  GeneratorSettings generateEquatable(bool generateEquatable) =>
      this(generateEquatable: generateEquatable);

  @override
  GeneratorSettings generateCopyWith(bool generateCopyWith) =>
      this(generateCopyWith: generateCopyWith);

  @override
  GeneratorSettings generateImports(bool generateImports) =>
      this(generateImports: generateImports);

  @override
  GeneratorSettings prefix(String? prefix) => this(prefix: prefix);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeneratorSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeneratorSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  GeneratorSettings call({
    Object? generateFromJson = const $CopyWithPlaceholder(),
    Object? generateToJson = const $CopyWithPlaceholder(),
    Object? generateEntity = const $CopyWithPlaceholder(),
    Object? generateEquatable = const $CopyWithPlaceholder(),
    Object? generateCopyWith = const $CopyWithPlaceholder(),
    Object? generateImports = const $CopyWithPlaceholder(),
    Object? prefix = const $CopyWithPlaceholder(),
  }) {
    return GeneratorSettings(
      generateFromJson: generateFromJson == const $CopyWithPlaceholder() ||
              generateFromJson == null
          // ignore: unnecessary_non_null_assertion
          ? _value.generateFromJson!
          // ignore: cast_nullable_to_non_nullable
          : generateFromJson as bool,
      generateToJson: generateToJson == const $CopyWithPlaceholder() ||
              generateToJson == null
          // ignore: unnecessary_non_null_assertion
          ? _value.generateToJson!
          // ignore: cast_nullable_to_non_nullable
          : generateToJson as bool,
      generateEntity: generateEntity == const $CopyWithPlaceholder() ||
              generateEntity == null
          // ignore: unnecessary_non_null_assertion
          ? _value.generateEntity!
          // ignore: cast_nullable_to_non_nullable
          : generateEntity as bool,
      generateEquatable: generateEquatable == const $CopyWithPlaceholder() ||
              generateEquatable == null
          // ignore: unnecessary_non_null_assertion
          ? _value.generateEquatable!
          // ignore: cast_nullable_to_non_nullable
          : generateEquatable as bool,
      generateCopyWith: generateCopyWith == const $CopyWithPlaceholder() ||
              generateCopyWith == null
          // ignore: unnecessary_non_null_assertion
          ? _value.generateCopyWith!
          // ignore: cast_nullable_to_non_nullable
          : generateCopyWith as bool,
      generateImports: generateImports == const $CopyWithPlaceholder() ||
              generateImports == null
          // ignore: unnecessary_non_null_assertion
          ? _value.generateImports!
          // ignore: cast_nullable_to_non_nullable
          : generateImports as bool,
      prefix: prefix == const $CopyWithPlaceholder()
          ? _value.prefix
          // ignore: cast_nullable_to_non_nullable
          : prefix as String?,
    );
  }
}

extension $GeneratorSettingsCopyWith on GeneratorSettings {
  /// Returns a callable class that can be used as follows: `instanceOfGeneratorSettings.copyWith(...)` or like so:`instanceOfGeneratorSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeneratorSettingsCWProxy get copyWith =>
      _$GeneratorSettingsCWProxyImpl(this);
}
