import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:system_theme/system_theme.dart';

part 'theme_manager_state.dart';
part 'theme_manager_cubit.g.dart';

class ThemeManagerCubit extends Cubit<ThemeManagerState> {
  ThemeManagerCubit() : super(ThemeManagerState.defaults());

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith.themeMode(themeMode));
  }
}
