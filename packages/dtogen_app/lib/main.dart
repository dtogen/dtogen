import 'package:dtogen_app/presentation/app/app.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_theme/system_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeStorage();

  try {
    await SystemTheme.accentColor.load();
  } finally {
    /// Don't let loading the accent color fail the app.
  }

  runApp(const MyApp());
}

Future<void> initializeStorage() async {
  final storageDirectory = kIsWeb
      ? HydratedStorage.webStorageDirectory
      : await getTemporaryDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: storageDirectory,
  );
}
