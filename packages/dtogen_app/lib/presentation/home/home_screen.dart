import 'package:dtogen_app/presentation/generator/generator_view/generator_view.dart';
import 'package:fluent_ui/fluent_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Text('DTO Gen'),
      ),
      content: GeneratorView(),
    );
  }
}
