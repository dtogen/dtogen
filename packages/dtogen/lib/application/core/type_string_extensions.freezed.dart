// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_string_extensions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TypeInfo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() primitive,
    required TResult Function(TypeInfo ofTypes) list,
    required TResult Function(String typeName) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? primitive,
    TResult? Function(TypeInfo ofTypes)? list,
    TResult? Function(String typeName)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? primitive,
    TResult Function(TypeInfo ofTypes)? list,
    TResult Function(String typeName)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Primitive value) primitive,
    required TResult Function(_List value) list,
    required TResult Function(_Custom value) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Primitive value)? primitive,
    TResult? Function(_List value)? list,
    TResult? Function(_Custom value)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Primitive value)? primitive,
    TResult Function(_List value)? list,
    TResult Function(_Custom value)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeInfoCopyWith<$Res> {
  factory $TypeInfoCopyWith(TypeInfo value, $Res Function(TypeInfo) then) =
      _$TypeInfoCopyWithImpl<$Res, TypeInfo>;
}

/// @nodoc
class _$TypeInfoCopyWithImpl<$Res, $Val extends TypeInfo>
    implements $TypeInfoCopyWith<$Res> {
  _$TypeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PrimitiveCopyWith<$Res> {
  factory _$$_PrimitiveCopyWith(
          _$_Primitive value, $Res Function(_$_Primitive) then) =
      __$$_PrimitiveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PrimitiveCopyWithImpl<$Res>
    extends _$TypeInfoCopyWithImpl<$Res, _$_Primitive>
    implements _$$_PrimitiveCopyWith<$Res> {
  __$$_PrimitiveCopyWithImpl(
      _$_Primitive _value, $Res Function(_$_Primitive) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Primitive implements _Primitive {
  const _$_Primitive();

  @override
  String toString() {
    return 'TypeInfo.primitive()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Primitive);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() primitive,
    required TResult Function(TypeInfo ofTypes) list,
    required TResult Function(String typeName) custom,
  }) {
    return primitive();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? primitive,
    TResult? Function(TypeInfo ofTypes)? list,
    TResult? Function(String typeName)? custom,
  }) {
    return primitive?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? primitive,
    TResult Function(TypeInfo ofTypes)? list,
    TResult Function(String typeName)? custom,
    required TResult orElse(),
  }) {
    if (primitive != null) {
      return primitive();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Primitive value) primitive,
    required TResult Function(_List value) list,
    required TResult Function(_Custom value) custom,
  }) {
    return primitive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Primitive value)? primitive,
    TResult? Function(_List value)? list,
    TResult? Function(_Custom value)? custom,
  }) {
    return primitive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Primitive value)? primitive,
    TResult Function(_List value)? list,
    TResult Function(_Custom value)? custom,
    required TResult orElse(),
  }) {
    if (primitive != null) {
      return primitive(this);
    }
    return orElse();
  }
}

abstract class _Primitive implements TypeInfo {
  const factory _Primitive() = _$_Primitive;
}

/// @nodoc
abstract class _$$_ListCopyWith<$Res> {
  factory _$$_ListCopyWith(_$_List value, $Res Function(_$_List) then) =
      __$$_ListCopyWithImpl<$Res>;
  @useResult
  $Res call({TypeInfo ofTypes});

  $TypeInfoCopyWith<$Res> get ofTypes;
}

/// @nodoc
class __$$_ListCopyWithImpl<$Res> extends _$TypeInfoCopyWithImpl<$Res, _$_List>
    implements _$$_ListCopyWith<$Res> {
  __$$_ListCopyWithImpl(_$_List _value, $Res Function(_$_List) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ofTypes = null,
  }) {
    return _then(_$_List(
      ofTypes: null == ofTypes
          ? _value.ofTypes
          : ofTypes // ignore: cast_nullable_to_non_nullable
              as TypeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeInfoCopyWith<$Res> get ofTypes {
    return $TypeInfoCopyWith<$Res>(_value.ofTypes, (value) {
      return _then(_value.copyWith(ofTypes: value));
    });
  }
}

/// @nodoc

class _$_List implements _List {
  const _$_List({required this.ofTypes});

  @override
  final TypeInfo ofTypes;

  @override
  String toString() {
    return 'TypeInfo.list(ofTypes: $ofTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_List &&
            (identical(other.ofTypes, ofTypes) || other.ofTypes == ofTypes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ofTypes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListCopyWith<_$_List> get copyWith =>
      __$$_ListCopyWithImpl<_$_List>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() primitive,
    required TResult Function(TypeInfo ofTypes) list,
    required TResult Function(String typeName) custom,
  }) {
    return list(ofTypes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? primitive,
    TResult? Function(TypeInfo ofTypes)? list,
    TResult? Function(String typeName)? custom,
  }) {
    return list?.call(ofTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? primitive,
    TResult Function(TypeInfo ofTypes)? list,
    TResult Function(String typeName)? custom,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(ofTypes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Primitive value) primitive,
    required TResult Function(_List value) list,
    required TResult Function(_Custom value) custom,
  }) {
    return list(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Primitive value)? primitive,
    TResult? Function(_List value)? list,
    TResult? Function(_Custom value)? custom,
  }) {
    return list?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Primitive value)? primitive,
    TResult Function(_List value)? list,
    TResult Function(_Custom value)? custom,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(this);
    }
    return orElse();
  }
}

abstract class _List implements TypeInfo {
  const factory _List({required final TypeInfo ofTypes}) = _$_List;

  TypeInfo get ofTypes;
  @JsonKey(ignore: true)
  _$$_ListCopyWith<_$_List> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CustomCopyWith<$Res> {
  factory _$$_CustomCopyWith(_$_Custom value, $Res Function(_$_Custom) then) =
      __$$_CustomCopyWithImpl<$Res>;
  @useResult
  $Res call({String typeName});
}

/// @nodoc
class __$$_CustomCopyWithImpl<$Res>
    extends _$TypeInfoCopyWithImpl<$Res, _$_Custom>
    implements _$$_CustomCopyWith<$Res> {
  __$$_CustomCopyWithImpl(_$_Custom _value, $Res Function(_$_Custom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeName = null,
  }) {
    return _then(_$_Custom(
      null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Custom implements _Custom {
  const _$_Custom(this.typeName);

  @override
  final String typeName;

  @override
  String toString() {
    return 'TypeInfo.custom(typeName: $typeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Custom &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomCopyWith<_$_Custom> get copyWith =>
      __$$_CustomCopyWithImpl<_$_Custom>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() primitive,
    required TResult Function(TypeInfo ofTypes) list,
    required TResult Function(String typeName) custom,
  }) {
    return custom(typeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? primitive,
    TResult? Function(TypeInfo ofTypes)? list,
    TResult? Function(String typeName)? custom,
  }) {
    return custom?.call(typeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? primitive,
    TResult Function(TypeInfo ofTypes)? list,
    TResult Function(String typeName)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(typeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Primitive value) primitive,
    required TResult Function(_List value) list,
    required TResult Function(_Custom value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Primitive value)? primitive,
    TResult? Function(_List value)? list,
    TResult? Function(_Custom value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Primitive value)? primitive,
    TResult Function(_List value)? list,
    TResult Function(_Custom value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class _Custom implements TypeInfo {
  const factory _Custom(final String typeName) = _$_Custom;

  String get typeName;
  @JsonKey(ignore: true)
  _$$_CustomCopyWith<_$_Custom> get copyWith =>
      throw _privateConstructorUsedError;
}
