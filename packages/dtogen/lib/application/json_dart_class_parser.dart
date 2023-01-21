import 'package:dtogen/application/core/type_string_extensions.dart';
import 'package:dtogen/application/core/typedefs.dart';
import 'package:dtogen/application/i_dart_class_parser.dart';
import 'package:dtogen/models/dart_class.dart';
import 'package:dtogen/models/json_parser_settings.dart';

class JsonDartClassParser extends IDartClassParser<Json> {
  JsonDartClassParser({
    required this.settings,
  });

  final JsonParserSettings settings;
  String get _prefix => settings.prefixName ?? '';

  @override
  Set<DartClass> parse(Json data) {
    final classes = <DartClass>{};
    _parseClass(
      className: _prefix.isEmpty ? 'Generated' : _prefix,
      json: data,
      generatedClasses: classes,
    );
    return classes;
  }

  DartClass _parseClass({
    required String className,
    required Json json,
    required Set<DartClass> generatedClasses,
  }) {
    final effectiveClassName = _addPrefixWithoutDuplications(className);

    final fields = _parseClassFields(json, generatedClasses);
    final parsedClass = DartClass(
      name: effectiveClassName,
      fields: fields,
    );
    generatedClasses.add(parsedClass);
    return parsedClass;
  }

  /// Join [_prefix] to [className].
  ///
  /// If [_prefix] ends with the same words as [className] then removes these words.
  /// For example:
  /// ```dart
  /// final classNamePrefix = "UpdateBooking";
  /// ...
  /// final className = _addPrefixWithoutDuplications("BookingPeriod");
  /// print(className); // UpdateBookingPeriod
  /// ```
  String _addPrefixWithoutDuplications(String className) {
    final prefix = _prefix;
    if (prefix.isEmpty) return className;

    final prefixParts = prefix.splitByUpperCase();
    if (prefixParts.length == 1) {
      if (className.startsWith(prefix)) {
        return className;
      } else {
        "$prefix$className";
      }
    }

    for (var i = prefixParts.length - 1; i > 0; i--) {
      final prefixPart = prefixParts.skip(i).join();
      if (className.startsWith(prefixPart)) {
        return "${prefixParts.take(i).join()}$className";
      }
    }

    return "$prefix$className";
  }

  List<DartClassField> _parseClassFields(Json json, Set<DartClass> generatedClasses) {
    return json //
        .entries
        .map((entry) => _parseField(entry.key, entry.value, generatedClasses))
        .toList();
  }

  DartClassField _parseField(
    String key,
    Object value,
    Set<DartClass> generatedClasses,
  ) {
    final isNullable = key.contains('?');
    key = key.replaceAll('?', '');

    final String fieldType;
    if (value is String) {
      fieldType = "String";
    } else if (value is int) {
      fieldType = "int";
    } else if (value is double) {
      fieldType = "double";
    } else if (value is bool) {
      fieldType = "bool";
    } else if (value is Json) {
      fieldType = _parseClass(
        className: _classNameFromKey(key),
        json: value,
        generatedClasses: generatedClasses,
      ).name;
    } else if (value is List) {
      final field = _parseField(key, value.first, generatedClasses);
      fieldType = "List<${field.typeName}>";
    } else {
      throw Exception(
        "Can't parse json field with because it's value type is not supported.\n"
        "Key: $key, value: $value",
      );
    }
    return DartClassField(
      name: key,
      typeName: fieldType,
      isNullable: isNullable,
    );
  }

  String _classNameFromKey(String key) {
    var fieldTypeName = key.split("_").map((e) => e.firstCharToUpperCase()).join();
    if (fieldTypeName.endsWith("s")) {
      fieldTypeName = fieldTypeName.substring(0, fieldTypeName.length - 1);
    }
    return fieldTypeName;
  }
}
