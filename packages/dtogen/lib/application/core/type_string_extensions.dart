import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_string_extensions.freezed.dart';

extension TypeStringExtensions on String {
  TypeInfo get typeInfo {
    final isPrimitive = const {'int', 'double', 'bool', 'String'}.contains(this);

    if (isPrimitive) {
      return TypeInfo.primitive();
    } else if (startsWith('List<')) {
      return TypeInfo.list(ofTypes: replaceFirst('List<', '').replaceFirst('>', '').typeInfo);
    } else if (this == 'DateTime') {
      return TypeInfo.dateTime();
    } else {
      return TypeInfo.custom(this);
    }
  }

  String firstCharToUpperCase() {
    if (isEmpty) {
      return "";
    }

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String firstCharToLowerCase() {
    if (isEmpty) {
      return "";
    }

    return "${this[0].toLowerCase()}${substring(1)}";
  }

  String dtoNameToEntity() {
    return replaceAll("Dto", "");
  }

  String camelCaseToSnakeCase() {
    return splitByUpperCase().map((e) => e.toLowerCase()).join("_");
  }

  List<String> splitByUpperCase() {
    return split(RegExp("(?=[A-Z])"));
  }
}

@freezed
class TypeInfo with _$TypeInfo {
  const factory TypeInfo.primitive() = _Primitive;
  const factory TypeInfo.list({required TypeInfo ofTypes}) = _List;
  const factory TypeInfo.dateTime() = _DateTime;
  const factory TypeInfo.custom(String typeName) = _Custom;
}
