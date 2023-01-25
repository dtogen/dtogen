import 'dart:developer';

import 'package:dtogen/application/generator.dart';
import 'package:dtogen/application/json_dart_class_parser.dart';
import 'package:dtogen/dtogen.dart';

void main() {
  final userJson = {
    'id': '',
    'name': 'string',
    'age': 20,
    'profile?': {
      'phone': 10,
      'email': 'string',
    },
    'friends': [
      {
        'id': '',
        'name': 'string',
        'age': 20,
        'profile?': {
          'phone': 10,
          'email': 'string',
        },
      },
    ],
  };

  const addImports = false;
  final generator = Generator(
    tokenGenerators: [
      DtoTokenGenerator(
        settings: const DtoGenerationSettings(
          generateFromJson: true,
          generateToJson: true,
        ),
        addImports: addImports,
        generateEntityMappers: true,
      ),
      EntityTokenGenerator(
        settings: const EntityGenerationSettings(
          addCopyWith: true,
          addEquatable: true,
        ),
        addImports: addImports,
      ),
    ],
  );
  final parser = JsonDartClassParser(
    settings: JsonParserSettings(prefixName: 'User'),
  );

  log(
    generator //
        .generateCode(parser.parse(userJson))
        .join('\n'),
  );
}
