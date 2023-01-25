import 'package:dtogen/application/code_generator.dart';
import 'package:dtogen/application/core/type_string_extensions.dart';
import 'package:dtogen/application/i_token_generator.dart';
import 'package:dtogen/models/dart_class.dart';
import 'package:dtogen/models/generated_model.dart';

class Generator {
  Generator({required this.tokenGenerators});

  final List<ITokenGenerator> tokenGenerators;

  List<GeneratedModel> generateCode(Set<DartClass> classes) {
    final generatedClasses = <GeneratedModel>[];
    const codeGenerator = CodeGenerator();

    for (final cl in classes) {
      for (final generator in tokenGenerators) {
        final generatedClassTokens = generator.generateTokens(cl);
        final generatedModel = GeneratedModel(
          fileName: '${cl.name.camelCaseToSnakeCase()}.dart',
          type: generator.modelGeneratorType,
          code: codeGenerator.generate(generatedClassTokens),
        );
        generatedClasses.add(generatedModel);
      }
    }

    return generatedClasses;
  }
}
