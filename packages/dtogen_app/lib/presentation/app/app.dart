import 'package:dtogen_app/application/core/theme_manager/theme_manager_cubit.dart';
import 'package:dtogen_app/dependencies/dependencies/core.dart';
import 'package:dtogen_app/presentation/home/home_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final glowFactor = is10footScreen() ? 2.0 : 0.0;

    return BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
      bloc: themeManagerCubit(),
      builder: (context, state) {
        return FluentApp(
          title: 'DTO Gen',
          themeMode: state.themeMode,
          color: state.accentColor,
          theme: ThemeData(
            brightness: Brightness.light,
            accentColor: state.accentColor,
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(glowFactor: glowFactor),
            scaffoldBackgroundColor: const Color(0xFFE0E0E0),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            accentColor: state.accentColor,
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(glowFactor: glowFactor),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
