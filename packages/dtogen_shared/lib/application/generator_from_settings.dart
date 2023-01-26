import 'package:dtogen/dtogen.dart';
import 'package:dtogen_shared/dtogen_storage.dart';

extension GeneratorFromSettings on CodeGenerationSettings {
  Generator createGeneratorFromSettings() {
    return Generator(
      tokenGenerators: [
        if (generateDtos)
          DtoTokenGenerator(
            settings: toDtoGenerationSettings(),
            addImports: shouldSplitByFiles,
            generateEntityMappers: generateEntities,
          ),
        if (generateEntities)
          EntityTokenGenerator(
            settings: toEntityGenerationSettings(),
            addImports: shouldSplitByFiles,
          ),
      ],
    );
  }
}
