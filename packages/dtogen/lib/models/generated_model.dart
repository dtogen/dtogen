class GeneratedModel {
  const GeneratedModel({
    required this.fileName,
    required this.code,
    required this.type,
  });

  final String fileName;
  final String code;
  final ModelType type;

  @override
  String toString() {
    return 'GeneratedModel(fileName: $fileName, type: $type, code: \n$code)';
  }
}

enum ModelType {
  entity,
  dto,
}
