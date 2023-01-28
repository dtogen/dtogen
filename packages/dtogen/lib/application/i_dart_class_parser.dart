import 'package:dtogen/models/dart_class.dart';

abstract class IDartClassParser<T> {
  Set<DartClass> parse(T data);
}
