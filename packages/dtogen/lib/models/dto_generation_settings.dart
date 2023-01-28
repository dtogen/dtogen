class DtoGenerationSettings {
  const DtoGenerationSettings({
    required this.generateToJson,
    required this.generateFromJson,
    required this.generateHiveAnnotations,
  });

  final bool generateToJson;
  final bool generateFromJson;
  final bool generateHiveAnnotations;
}
