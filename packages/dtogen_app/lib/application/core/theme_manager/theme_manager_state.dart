part of 'theme_manager_cubit.dart';

@CopyWith()
class ThemeManagerState extends Equatable {
  const ThemeManagerState({
    required this.themeMode,
    required this.accentColor,
  });

  factory ThemeManagerState.defaults() {
    return ThemeManagerState(
      themeMode: ThemeMode.system,
      accentColor: SystemTheme.accentColor.accent.toAccentColor(),
    );
  }

  final ThemeMode themeMode;
  final AccentColor accentColor;

  @override
  List<Object?> get props => [themeMode, accentColor];
}
