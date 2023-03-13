import 'package:code_text_field/code_text_field.dart';
import 'package:dtogen_app/application/generator/generator_bloc/generator_bloc.dart';
import 'package:dtogen_app/application/generator/generator_settings/generator_settings_cubit.dart';
import 'package:dtogen_app/dependencies/dependencies/generator.dart';
import 'package:dtogen_app/domain/generator/generator_settings/generator_settings_entity.dart';
import 'package:dtogen_app/presentation/generator/generator_view/widgets/settings_view.dart';
import 'package:flex_list/flex_list.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/themes/gruvbox-dark.dart' as highlight_theme;
import 'package:flutter_highlight/themes/gruvbox-light.dart' as highlight_theme;
import 'package:highlight/languages/dart.dart' as highlight;
import 'package:highlight/languages/json.dart' as highlight;

part 'bloc/generator_view_bloc_wrappers.dart';
part 'widgets/generator_action_buttons.dart';

class GeneratorView extends StatefulWidget {
  const GeneratorView({super.key});

  @override
  State<GeneratorView> createState() => _GeneratorViewState();
}

class _GeneratorViewState extends State<GeneratorView> {
  final _inputCodeController = CodeController(language: highlight.json);
  final _outputCodeController = CodeController(language: highlight.dart);

  @override
  void dispose() {
    _inputCodeController.dispose();
    _outputCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const minLines = 10;

    final brightness = FluentTheme.of(context).brightness;

    return _GeneratorViewBlocWrappers(
      outputController: _outputCodeController,
      child: CodeTheme(
        data: CodeThemeData(
          styles: brightness == Brightness.light
              ? highlight_theme.gruvboxLightTheme
              : highlight_theme.gruvboxDarkTheme,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextBox(
                              controller: _inputCodeController,
                              header: 'Input',
                              minLines: minLines,
                              maxLines: null,
                              style: const TextStyle(
                                fontFamily: 'Roboto Mono',
                              ),
                            ),
                          ),
                        ),
                        _GeneratorActionButtons(
                          inputController: _inputCodeController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SettingsView(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextBox(
                  controller: _outputCodeController,
                  header: 'Output',
                  minLines: 1000,
                  maxLines: null,
                  readOnly: true,
                  style: const TextStyle(
                    fontFamily: 'Roboto Mono',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
