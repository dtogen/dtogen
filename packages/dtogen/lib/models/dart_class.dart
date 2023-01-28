import 'package:dtogen/application/core/type_string_extensions.dart';
import 'package:equatable/equatable.dart';

class DartClass extends Equatable {
  const DartClass({
    required this.name,
    required this.fields,
  });

  final String name;
  final List<DartClassField> fields;

  @override
  List<Object?> get props => [name, fields];
}

class DartClassField with EquatableMixin {
  DartClassField({
    required this.name,
    required this.typeName,
    required this.isNullable,
  });

  final String name;
  final String typeName;
  final bool isNullable;
  late final TypeInfo typeInfo = typeName.typeInfo;

  @override
  List<Object?> get props => [name, typeName, isNullable];
}
