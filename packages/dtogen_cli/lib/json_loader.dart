import 'dart:convert';
import 'dart:io';

import 'package:dtogen/dtogen.dart';

/// Loads json from a file if [pathToFile] is provided.
///
/// Otherwise loads json from the clipboard.
Future<Json> loadJson(String? pathToFile) async {
  final String jsonString;
  if (pathToFile == null) {
    jsonString = await _loadFromClipboard();
  } else {
    jsonString = await _loadFromFile(pathToFile);
  }
  try {
    final json = jsonDecode(jsonString);

    if (json is! Json) {
      print(
        "Json's top-level structure supposed to be a Map but given is ${json.runtimeType}",
      );
      exit(1);
    }
    return json;
  } on FormatException catch (e) {
    if (pathToFile == null) {
      print("Data from your clipboard is not valid json. Use `-h` flag for help\n$e");
    } else {
      print("Given json is not valid: $e");
    }
    exit(1);
  }
}

Future<String> _loadFromClipboard() async {
  final processResult = await Process.run('pbpaste', []);
  final jsonData = processResult.stdout;
  if (jsonData is! String) {
    print("Json data must be a string");
    exit(1);
  }
  return jsonData;
}

Future<String> _loadFromFile(String path) async {
  final fileWithJson = File(path);
  if (!fileWithJson.existsSync()) {
    print("Given file $path doesn't exist");
    exit(1);
  }
  return fileWithJson.readAsString();
}
