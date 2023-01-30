import 'package:dtogen_app/application/generator/generator_bloc/generator_bloc.dart';
import 'package:dtogen_app/application/generator/generator_settings/generator_settings_cubit.dart';
import 'package:dtogen_app/dependencies/dependencies/generator.dart';
import 'package:dtogen_app/presentation/generator/generator_view/widgets/settings_view.dart';
import 'package:flex_list/flex_list.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'widgets/generator_action_buttons.dart';

class GeneratorView extends HookWidget {
  const GeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    final inputController = useTextEditingController();
    final outputController = useTextEditingController();

    const minLines = 10;

    return MultiBlocProvider(
      providers: [
        BlocProvider<GeneratorSettingsCubit>(
          create: (_) => generatorSettingsCubitFactory(),
        ),
        BlocProvider<GeneratorBloc>(
          create: (_) => generatorBlocFactory(),
        ),
      ],
      child: BlocListener<GeneratorBloc, GeneratorState>(
        listener: (context, state) {
          state.mapOrNull(
            generated: (generatedState) {
              outputController.text = generatedState.output;
            },
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextBox(
                      controller: inputController,
                      header: 'Input',
                      minLines: minLines,
                      maxLines: null,
                    ),
                  ),
                  _GeneratorActionButtons(
                    inputController: inputController,
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SettingsView(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextBox(
                  controller: outputController,
                  header: 'Output',
                  minLines: 1000,
                  maxLines: null,
                  readOnly: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
