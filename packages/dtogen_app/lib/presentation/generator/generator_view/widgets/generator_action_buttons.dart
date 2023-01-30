part of '../generator_view.dart';

class _GeneratorActionButtons extends StatelessWidget {
  const _GeneratorActionButtons({
    required this.inputController,
    super.key,
  });

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: 400,
        child: FlexList(
          children: [
            FilledButton(
              onPressed: () {
                context.read<GeneratorBloc>().add(
                      GeneratorEvent.generationRequested(inputController.text),
                    );
              },
              child: const Text('GENERATE'),
            ),
            BlocBuilder<GeneratorBloc, GeneratorState>(
              builder: (context, state) {
                final onPressed = state.maybeWhen(
                  orElse: () => null,
                  generated: (generatedCode) => () {
                    Clipboard.setData(
                      ClipboardData(text: generatedCode),
                    );
                  },
                );

                return FilledButton(
                  onPressed: onPressed,
                  child: const Text('COPY RESULT'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
