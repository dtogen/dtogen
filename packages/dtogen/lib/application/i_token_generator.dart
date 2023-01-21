import 'package:dtogen/models/dart_class.dart';
import 'package:dtogen/models/dart_token.dart';
import 'package:dtogen/models/generated_model.dart';

abstract class ITokenGenerator {
  ITokenGenerator({
    required this.addImports,
    required this.modelGeneratorType,
  });

  final bool addImports;
  final ModelType modelGeneratorType;

  List<DartToken> generateTokens(DartClass dartClass);
}
