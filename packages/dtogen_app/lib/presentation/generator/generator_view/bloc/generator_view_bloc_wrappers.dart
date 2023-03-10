part of '../generator_view.dart';

class _GeneratorViewBlocWrappers extends StatelessWidget {
  const _GeneratorViewBlocWrappers({
    required this.outputController,
    required this.child,
    super.key,
  });

  final Widget child;
  final TextEditingController outputController;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeneratorSettingsCubit>(
          create: (_) => generatorSettingsCubitFactory(),
        ),
        BlocProvider<GeneratorBloc>(
          create: (context) => generatorBlocFactory()
            ..add(
              GeneratorEvent.settingsUpdated(
                context.read<GeneratorSettingsCubit>().state,
              ),
            ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GeneratorSettingsCubit, GeneratorSettings>(
            listener: _generatorSettingsListener,
          ),
          BlocListener<GeneratorBloc, GeneratorState>(
            listener: _generatorStateListener,
          ),
        ],
        child: child,
      ),
    );
  }

  void _generatorSettingsListener(
    BuildContext context,
    GeneratorSettings settings,
  ) {
    context.read<GeneratorBloc>().add(GeneratorEvent.settingsUpdated(settings));
  }

  void _generatorStateListener(BuildContext context, GeneratorState state) {
    state.mapOrNull(
      generated: (generatedState) {
        outputController.text = generatedState.output;
      },
    );
  }
}
