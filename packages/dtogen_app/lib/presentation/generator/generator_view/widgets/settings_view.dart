import 'package:dtogen_app/application/generator/generator_settings/generator_settings_cubit.dart';
import 'package:dtogen_app/domain/generator/generator_settings/generator_settings_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsView extends HookWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final generateJsonExpanded = useState<bool>(true);
    final generateEntityExpanded = useState<bool>(true);

    return BlocBuilder<GeneratorSettingsCubit, GeneratorSettings>(
      builder: (context, state) {
        print('${state.generateEntity}');

        return TreeView(
          selectionMode: TreeViewSelectionMode.multiple,
          deselectParentWhenChildrenDeselected: false,
          items: [
            TreeViewItem(
              content: const Text('Generate JSON'),
              expanded: generateJsonExpanded.value,
              onInvoked: (item, reason) async {
                if (reason == TreeViewItemInvokeReason.pressed) {
                  generateJsonExpanded.value = !generateJsonExpanded.value;
                }
              },
              children: [
                TreeViewItem(
                  content: const Text('Generate fromJson'),
                  selected: state.generateFromJson,
                  onInvoked: (item, reason) async {
                    context
                        .read<GeneratorSettingsCubit>()
                        .setGenerateFromJson(!state.generateFromJson);
                  },
                ),
                TreeViewItem(
                  selected: state.generateToJson,
                  onInvoked: (item, reason) async {
                    context
                        .read<GeneratorSettingsCubit>()
                        .setGenerateToJson(!state.generateToJson);
                  },
                  content: const Text('Generate toJson'),
                ),
              ],
            ),
            TreeViewItem(
              content: const Text('Entity settings'),
              expanded: generateEntityExpanded.value,
              onInvoked: (item, reason) async {
                if (reason == TreeViewItemInvokeReason.pressed) {
                  generateEntityExpanded.value = !generateEntityExpanded.value;
                }
              },
              // expanded: generateEntityExpanded.value,
              children: [
                TreeViewItem(
                  content: const Text('Generate Entity'),
                  value: state.generateEntity,
                  onInvoked: (item, reason) async {
                    context
                        .read<GeneratorSettingsCubit>()
                        .setGenerateEntity(!state.generateEntity);
                  },
                ),
                TreeViewItem(
                  content: const Text('Generate Equatable'),
                  value: state.generateEquatable,
                  onInvoked: (item, reason) async {
                    context
                        .read<GeneratorSettingsCubit>()
                        .setGenerateEquatable(!state.generateEquatable);
                  },
                ),
                TreeViewItem(
                  content: const Text('Generate copyWith'),
                  value: state.generateCopyWith,
                  onInvoked: (item, reason) async {
                    context
                        .read<GeneratorSettingsCubit>()
                        .setGenerateCopyWith(!state.generateCopyWith);
                  },
                ),
              ],
            ),
            TreeViewItem(content: const Text('Generate Imports')),
          ],
        );
      },
    );
  }
}
