// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dart_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DartToken {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)
        classDeclaration,
    required TResult Function(String path, ImportTokenType type) import,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)?
        classDeclaration,
    TResult? Function(String path, ImportTokenType type)? import,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)?
        classDeclaration,
    TResult Function(String path, ImportTokenType type)? import,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClassToken value) classDeclaration,
    required TResult Function(ImportToken value) import,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClassToken value)? classDeclaration,
    TResult? Function(ImportToken value)? import,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClassToken value)? classDeclaration,
    TResult Function(ImportToken value)? import,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DartTokenCopyWith<$Res> {
  factory $DartTokenCopyWith(DartToken value, $Res Function(DartToken) then) =
      _$DartTokenCopyWithImpl<$Res, DartToken>;
}

/// @nodoc
class _$DartTokenCopyWithImpl<$Res, $Val extends DartToken>
    implements $DartTokenCopyWith<$Res> {
  _$DartTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ClassTokenCopyWith<$Res> {
  factory _$$ClassTokenCopyWith(
          _$ClassToken value, $Res Function(_$ClassToken) then) =
      __$$ClassTokenCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name,
      List<FieldToken> fields,
      List<MethodToken> methods,
      List<FactoryToken> factories,
      List<AnnotationToken> annotations,
      List<String> mixins,
      List<String> interfaces,
      ReferenceToken? extend});
}

/// @nodoc
class __$$ClassTokenCopyWithImpl<$Res>
    extends _$DartTokenCopyWithImpl<$Res, _$ClassToken>
    implements _$$ClassTokenCopyWith<$Res> {
  __$$ClassTokenCopyWithImpl(
      _$ClassToken _value, $Res Function(_$ClassToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fields = null,
    Object? methods = null,
    Object? factories = null,
    Object? annotations = null,
    Object? mixins = null,
    Object? interfaces = null,
    Object? extend = freezed,
  }) {
    return _then(_$ClassToken(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<FieldToken>,
      methods: null == methods
          ? _value._methods
          : methods // ignore: cast_nullable_to_non_nullable
              as List<MethodToken>,
      factories: null == factories
          ? _value._factories
          : factories // ignore: cast_nullable_to_non_nullable
              as List<FactoryToken>,
      annotations: null == annotations
          ? _value._annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<AnnotationToken>,
      mixins: null == mixins
          ? _value._mixins
          : mixins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      interfaces: null == interfaces
          ? _value._interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<String>,
      extend: freezed == extend
          ? _value.extend
          : extend // ignore: cast_nullable_to_non_nullable
              as ReferenceToken?,
    ));
  }
}

/// @nodoc

class _$ClassToken implements ClassToken {
  const _$ClassToken(
      {required this.name,
      required final List<FieldToken> fields,
      required final List<MethodToken> methods,
      final List<FactoryToken> factories = const [],
      final List<AnnotationToken> annotations = const [],
      final List<String> mixins = const [],
      final List<String> interfaces = const [],
      this.extend})
      : _fields = fields,
        _methods = methods,
        _factories = factories,
        _annotations = annotations,
        _mixins = mixins,
        _interfaces = interfaces;

  @override
  final String name;
  final List<FieldToken> _fields;
  @override
  List<FieldToken> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  final List<MethodToken> _methods;
  @override
  List<MethodToken> get methods {
    if (_methods is EqualUnmodifiableListView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methods);
  }

  final List<FactoryToken> _factories;
  @override
  @JsonKey()
  List<FactoryToken> get factories {
    if (_factories is EqualUnmodifiableListView) return _factories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_factories);
  }

  final List<AnnotationToken> _annotations;
  @override
  @JsonKey()
  List<AnnotationToken> get annotations {
    if (_annotations is EqualUnmodifiableListView) return _annotations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_annotations);
  }

  final List<String> _mixins;
  @override
  @JsonKey()
  List<String> get mixins {
    if (_mixins is EqualUnmodifiableListView) return _mixins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mixins);
  }

  final List<String> _interfaces;
  @override
  @JsonKey()
  List<String> get interfaces {
    if (_interfaces is EqualUnmodifiableListView) return _interfaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interfaces);
  }

  @override
  final ReferenceToken? extend;

  @override
  String toString() {
    return 'DartToken.classDeclaration(name: $name, fields: $fields, methods: $methods, factories: $factories, annotations: $annotations, mixins: $mixins, interfaces: $interfaces, extend: $extend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassToken &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            const DeepCollectionEquality().equals(other._methods, _methods) &&
            const DeepCollectionEquality()
                .equals(other._factories, _factories) &&
            const DeepCollectionEquality()
                .equals(other._annotations, _annotations) &&
            const DeepCollectionEquality().equals(other._mixins, _mixins) &&
            const DeepCollectionEquality()
                .equals(other._interfaces, _interfaces) &&
            (identical(other.extend, extend) || other.extend == extend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_fields),
      const DeepCollectionEquality().hash(_methods),
      const DeepCollectionEquality().hash(_factories),
      const DeepCollectionEquality().hash(_annotations),
      const DeepCollectionEquality().hash(_mixins),
      const DeepCollectionEquality().hash(_interfaces),
      extend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassTokenCopyWith<_$ClassToken> get copyWith =>
      __$$ClassTokenCopyWithImpl<_$ClassToken>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)
        classDeclaration,
    required TResult Function(String path, ImportTokenType type) import,
  }) {
    return classDeclaration(name, fields, methods, factories, annotations,
        mixins, interfaces, extend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)?
        classDeclaration,
    TResult? Function(String path, ImportTokenType type)? import,
  }) {
    return classDeclaration?.call(name, fields, methods, factories, annotations,
        mixins, interfaces, extend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)?
        classDeclaration,
    TResult Function(String path, ImportTokenType type)? import,
    required TResult orElse(),
  }) {
    if (classDeclaration != null) {
      return classDeclaration(name, fields, methods, factories, annotations,
          mixins, interfaces, extend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClassToken value) classDeclaration,
    required TResult Function(ImportToken value) import,
  }) {
    return classDeclaration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClassToken value)? classDeclaration,
    TResult? Function(ImportToken value)? import,
  }) {
    return classDeclaration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClassToken value)? classDeclaration,
    TResult Function(ImportToken value)? import,
    required TResult orElse(),
  }) {
    if (classDeclaration != null) {
      return classDeclaration(this);
    }
    return orElse();
  }
}

abstract class ClassToken implements DartToken {
  const factory ClassToken(
      {required final String name,
      required final List<FieldToken> fields,
      required final List<MethodToken> methods,
      final List<FactoryToken> factories,
      final List<AnnotationToken> annotations,
      final List<String> mixins,
      final List<String> interfaces,
      final ReferenceToken? extend}) = _$ClassToken;

  String get name;
  List<FieldToken> get fields;
  List<MethodToken> get methods;
  List<FactoryToken> get factories;
  List<AnnotationToken> get annotations;
  List<String> get mixins;
  List<String> get interfaces;
  ReferenceToken? get extend;
  @JsonKey(ignore: true)
  _$$ClassTokenCopyWith<_$ClassToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportTokenCopyWith<$Res> {
  factory _$$ImportTokenCopyWith(
          _$ImportToken value, $Res Function(_$ImportToken) then) =
      __$$ImportTokenCopyWithImpl<$Res>;
  @useResult
  $Res call({String path, ImportTokenType type});
}

/// @nodoc
class __$$ImportTokenCopyWithImpl<$Res>
    extends _$DartTokenCopyWithImpl<$Res, _$ImportToken>
    implements _$$ImportTokenCopyWith<$Res> {
  __$$ImportTokenCopyWithImpl(
      _$ImportToken _value, $Res Function(_$ImportToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? type = null,
  }) {
    return _then(_$ImportToken(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImportTokenType,
    ));
  }
}

/// @nodoc

class _$ImportToken implements ImportToken {
  const _$ImportToken({required this.path, this.type = ImportTokenType.import});

  @override
  final String path;
  @override
  @JsonKey()
  final ImportTokenType type;

  @override
  String toString() {
    return 'DartToken.import(path: $path, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportToken &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportTokenCopyWith<_$ImportToken> get copyWith =>
      __$$ImportTokenCopyWithImpl<_$ImportToken>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)
        classDeclaration,
    required TResult Function(String path, ImportTokenType type) import,
  }) {
    return import(path, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)?
        classDeclaration,
    TResult? Function(String path, ImportTokenType type)? import,
  }) {
    return import?.call(path, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            List<FieldToken> fields,
            List<MethodToken> methods,
            List<FactoryToken> factories,
            List<AnnotationToken> annotations,
            List<String> mixins,
            List<String> interfaces,
            ReferenceToken? extend)?
        classDeclaration,
    TResult Function(String path, ImportTokenType type)? import,
    required TResult orElse(),
  }) {
    if (import != null) {
      return import(path, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClassToken value) classDeclaration,
    required TResult Function(ImportToken value) import,
  }) {
    return import(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClassToken value)? classDeclaration,
    TResult? Function(ImportToken value)? import,
  }) {
    return import?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClassToken value)? classDeclaration,
    TResult Function(ImportToken value)? import,
    required TResult orElse(),
  }) {
    if (import != null) {
      return import(this);
    }
    return orElse();
  }
}

abstract class ImportToken implements DartToken {
  const factory ImportToken(
      {required final String path, final ImportTokenType type}) = _$ImportToken;

  String get path;
  ImportTokenType get type;
  @JsonKey(ignore: true)
  _$$ImportTokenCopyWith<_$ImportToken> get copyWith =>
      throw _privateConstructorUsedError;
}
