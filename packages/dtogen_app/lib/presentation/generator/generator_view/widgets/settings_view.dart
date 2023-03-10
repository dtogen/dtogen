import 'package:dtogen_app/application/generator/generator_settings/generator_settings_cubit.dart';
import 'package:dtogen_app/domain/generator/generator_settings/generator_settings_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsView extends StatefulHookWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  GeneratorSettingsCubit get _cubit => context.read<GeneratorSettingsCubit>();

  @override
  Widget build(BuildContext context) {
    final generateJsonExpanded = useState<bool>(true);
    final generateEntityExpanded = useState<bool>(true);

    return BlocBuilder<GeneratorSettingsCubit, GeneratorSettings>(
      builder: (context, state) {
        return TreeView(
          selectionMode: TreeViewSelectionMode.multiple,
          deselectParentWhenChildrenDeselected: false,
          items: [
            TreeViewItem(
              content: const Text('Generate JSON'),
              expanded: generateJsonExpanded.value,
              onInvoked: (item, reason) async {
                switch (reason) {
                  case TreeViewItemInvokeReason.expandToggle:
                  case TreeViewItemInvokeReason.pressed:
                    generateJsonExpanded.value = !generateJsonExpanded.value;
                    break;
                  case TreeViewItemInvokeReason.selectionToggle:
                    final newValue = item.selected == true;

                    _setGenerateFromJson(newValue);
                    _setGenerateToJson(newValue);
                    _setAddHiveToDto(newValue);

                    break;
                }
              },
              children: [
                TreeViewItem(
                  content: const Text('Generate fromJson'),
                  selected: state.generateFromJson,
                  onInvoked: (_, __) async {
                    _setGenerateFromJson(!state.generateFromJson);
                  },
                ),
                TreeViewItem(
                  selected: state.generateToJson,
                  onInvoked: (_, __) async {
                    _setGenerateToJson(!state.generateToJson);
                  },
                  content: const Text('Generate toJson'),
                ),
                if (state.generateToJson || state.generateFromJson)
                  TreeViewItem(
                    content: const Text('Add Hive annotations'),
                    selected: state.addHiveToDto,
                    onInvoked: (_, __) async {
                      _setAddHiveToDto(!state.addHiveToDto);
                    },
                  ),
              ],
            ),
            TreeViewItem(
              content: const Text('Entity settings'),
              expanded: generateEntityExpanded.value,
              onInvoked: (item, reason) async {
                switch (reason) {
                  case TreeViewItemInvokeReason.expandToggle:
                  case TreeViewItemInvokeReason.pressed:
                    generateEntityExpanded.value =
                        !generateEntityExpanded.value;
                    break;
                  case TreeViewItemInvokeReason.selectionToggle:
                    final newValue = item.selected == true;

                    _setGenerateEntity(newValue);
                    _setGenerateEquatable(newValue);
                    _setGenerateCopyWith(newValue);
                    _setAddHiveToEntity(newValue);

                    break;
                }
              },
              children: [
                TreeViewItem(
                  content: const Text('Generate Entity'),
                  selected: state.generateEntity,
                  onInvoked: (_, __) async {
                    _setGenerateEntity(!state.generateEntity);
                  },
                ),
                if (state.generateEntity) ...[
                  TreeViewItem(
                    content: const Text('Add Equatable'),
                    selected: state.generateEquatable,
                    onInvoked: (_, __) async {
                      _setGenerateEquatable(!state.generateEquatable);
                    },
                  ),
                  TreeViewItem(
                    content: const Text('Add copyWith'),
                    selected: state.generateCopyWith,
                    onInvoked: (_, __) async {
                      _setGenerateCopyWith(!state.generateCopyWith);
                    },
                  ),
                  TreeViewItem(
                    content: const Text('Add Hive annotations'),
                    selected: state.addHiveToEntity,
                    onInvoked: (_, __) async {
                      _setAddHiveToEntity(!state.addHiveToEntity);
                    },
                  ),
                ],
              ],
            ),
            TreeViewItem(
              content: const Text('Generate Imports'),
              selected: state.generateImports,
              onInvoked: (_, __) async {
                _setGenerateImports(!state.generateImports);
              },
            ),
          ],
        );
      },
    );
  }

  void _setGenerateFromJson(bool value) {
    _cubit.setGenerateFromJson(value);
  }

  void _setGenerateToJson(bool value) {
    _cubit.setGenerateToJson(value);
  }

  void _setAddHiveToDto(bool value) {
    _cubit.setAddHiveToDto(value);
  }

  void _setGenerateEntity(bool value) {
    _cubit.setGenerateEntity(value);
  }

  void _setGenerateEquatable(bool value) {
    _cubit.setGenerateEquatable(value);
  }

  void _setGenerateCopyWith(bool value) {
    _cubit.setGenerateCopyWith(value);
  }

  void _setAddHiveToEntity(bool value) {
    _cubit.setAddHiveToEntity(value);
  }

  void _setGenerateImports(bool value) {
    _cubit.setGenerateImports(value);
  }
}
