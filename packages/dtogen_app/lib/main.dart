import 'dart:convert';

import 'package:dtogen/dtogen.dart';
import 'package:dtogen_shared/dtogen_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dto Gen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputController = useTextEditingController();
    final outputController = useTextEditingController();
    final classNamePrefixController = useTextEditingController();

    const decoration = InputDecoration(
      border: OutlineInputBorder(),
      alignLabelWithHint: true,
    );
    const minLines = 10;

    final generateFromJson = useState<bool>(true);
    final generateToJson = useState<bool>(false);
    final generateFromEntity = useState<bool>(false);
    final generateToEntity = useState<bool>(false);
    final generateEntity = useState<bool>(false);
    final generateCopyWith = useState<bool>(false);
    final generateImports = useState<bool>(true);

    void generateDto() {
      final settings = CodeGenerationSettings(
        modelTypesToGenerate: {
          if (generateEntity.value) ModelType.entity,
          ModelType.dto,
        },
        splitByFiles: false,
        generateToJson: generateToJson.value,
        generateFromJson: generateFromJson.value,
        addCopyWith: generateCopyWith.value,
        addEquatable: true,
        prefixName: classNamePrefixController.text.isEmpty ? null : classNamePrefixController.text,
      );

      final generator = Generator(
        tokenGenerators: [
          if (settings.generateDtos)
            DtoTokenGenerator(
              settings: const DtoGenerationSettings(
                generateFromJson: true,
                generateToJson: true,
              ),
              addImports: settings.splitByFiles == true,
              generateEntityMappers: settings.generateEntities,
            ),
          if (settings.generateEntities)
            EntityTokenGenerator(
              settings: const EntityGenerationSettings(
                addCopyWith: true,
                addEquatable: true,
              ),
              addImports: settings.splitByFiles == true,
            ),
        ],
      );
      final parser = JsonDartClassParser(
        settings: JsonParserSettings(prefixName: settings.prefixName),
      );

      try {
        final json = jsonDecode(inputController.text);
        final generateResult = generator.generateCode(parser.parse(json));
        final stringClasses = generateResult.map((e) => e.code).join('\n');

        outputController.text = stringClasses;
      } catch (error) {
        outputController.text = error.toString();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('DTO Generator'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: inputController,
                      decoration: decoration.copyWith(labelText: 'Input'),
                      minLines: minLines,
                      maxLines: null,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        TextField(
                          controller: outputController,
                          decoration: decoration.copyWith(labelText: 'Output'),
                          minLines: minLines,
                          maxLines: null,
                          readOnly: true,
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(text: outputController.text),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: generateDto,
            child: const Text('GENERATE'),
          ),
          SwitchListTile(
            title: const Text('generateFromJson'),
            value: generateFromJson.value,
            onChanged: (value) => generateFromJson.value = value,
          ),
          SwitchListTile(
            title: const Text('generateToJson'),
            value: generateToJson.value,
            onChanged: (value) => generateToJson.value = value,
          ),
          SwitchListTile(
            title: const Text('generateFromEntity'),
            value: generateFromEntity.value,
            onChanged: (value) => generateFromEntity.value = value,
          ),
          SwitchListTile(
            title: const Text('generateToEntity'),
            value: generateToEntity.value,
            onChanged: (value) => generateToEntity.value = value,
          ),
          SwitchListTile(
            title: const Text('generateEntity'),
            value: generateEntity.value,
            onChanged: (value) => generateEntity.value = value,
          ),
          SwitchListTile(
            title: const Text('generateCopyWith'),
            value: generateCopyWith.value,
            onChanged: (value) => generateCopyWith.value = value,
          ),
          SwitchListTile(
            title: const Text('generateImports'),
            value: generateImports.value,
            onChanged: (value) => generateImports.value = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: classNamePrefixController,
              decoration: decoration.copyWith(labelText: 'classNamePrefix'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
