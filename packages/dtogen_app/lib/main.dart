import 'package:dtogen_app/presentation/app/app.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeStorage();

  try {
    await windowManager.ensureInitialized();

    await SystemTheme.accentColor.load();
    await _maybeSetupWindowSize();
  } finally {
    // Don't let the failure of these operations block the app from starting.
  }

  runApp(const MyApp());
}

Future<void> _initializeStorage() async {
  final storageDirectory = kIsWeb
      ? HydratedStorage.webStorageDirectory
      : await getTemporaryDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: storageDirectory,
  );
}

/// Sets the minimum window size if on desktop.
Future<void> _maybeSetupWindowSize() async {
  const minSize = Size(600, 600);

  if (_checkIsDesktop()) {
    await windowManager.setMinimumSize(minSize);
  }
}

bool _checkIsDesktop() {
  return Platform.isMacOS || Platform.isLinux || Platform.isWindows;
}
