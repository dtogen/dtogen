class DtoGenerationSettings {
  const DtoGenerationSettings({
    required this.generateToJson,
    required this.generateFromJson,
  });

  final bool generateToJson;
  final bool generateFromJson;
}
