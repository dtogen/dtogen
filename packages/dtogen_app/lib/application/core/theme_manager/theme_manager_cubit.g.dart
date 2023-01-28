// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_manager_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThemeManagerStateCWProxy {
  ThemeManagerState themeMode(ThemeMode themeMode);

  ThemeManagerState accentColor(AccentColor accentColor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThemeManagerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThemeManagerState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThemeManagerState call({
    ThemeMode? themeMode,
    AccentColor? accentColor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThemeManagerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThemeManagerState.copyWith.fieldName(...)`
class _$ThemeManagerStateCWProxyImpl implements _$ThemeManagerStateCWProxy {
  const _$ThemeManagerStateCWProxyImpl(this._value);

  final ThemeManagerState _value;

  @override
  ThemeManagerState themeMode(ThemeMode themeMode) =>
      this(themeMode: themeMode);

  @override
  ThemeManagerState accentColor(AccentColor accentColor) =>
      this(accentColor: accentColor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThemeManagerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThemeManagerState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThemeManagerState call({
    Object? themeMode = const $CopyWithPlaceholder(),
    Object? accentColor = const $CopyWithPlaceholder(),
  }) {
    return ThemeManagerState(
      themeMode: themeMode == const $CopyWithPlaceholder() || themeMode == null
          // ignore: unnecessary_non_null_assertion
          ? _value.themeMode!
          // ignore: cast_nullable_to_non_nullable
          : themeMode as ThemeMode,
      accentColor:
          accentColor == const $CopyWithPlaceholder() || accentColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.accentColor!
              // ignore: cast_nullable_to_non_nullable
              : accentColor as AccentColor,
    );
  }
}

extension $ThemeManagerStateCopyWith on ThemeManagerState {
  /// Returns a callable class that can be used as follows: `instanceOfThemeManagerState.copyWith(...)` or like so:`instanceOfThemeManagerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThemeManagerStateCWProxy get copyWith =>
      _$ThemeManagerStateCWProxyImpl(this);
}
