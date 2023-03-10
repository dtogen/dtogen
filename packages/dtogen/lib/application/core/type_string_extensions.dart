import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_string_extensions.freezed.dart';

extension TypeStringExtensions on String {
  TypeInfo get typeInfo {
    const primitiveTypes = {'int', 'double', 'bool', 'String'};

    final isPrimitive = primitiveTypes.contains(this);

    if (isPrimitive) {
      return const TypeInfo.primitive();
    } else if (startsWith('List<')) {
      return TypeInfo.list(
        ofTypes: replaceFirst('List<', '').replaceFirst('>', '').typeInfo,
      );
    } else if (this == 'DateTime') {
      return const TypeInfo.dateTime();
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

  String toCamelCase() {
    return replaceAll(RegExp(r"(_|-)+"), " ")
        .split(" ")
        .map((str) => str.firstCharToUpperCase())
        .join()
        .firstCharToLowerCase();
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
