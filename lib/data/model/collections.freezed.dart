// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'collections.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Collections _$CollectionsFromJson(Map<String, dynamic> json) {
  return _Collections.fromJson(json);
}

/// @nodoc
class _$CollectionsTearOff {
  const _$CollectionsTearOff();

  _Collections call(
      {required String status,
      required int totalResults,
      required List<Collection> col}) {
    return _Collections(
      status: status,
      totalResults: totalResults,
      col: col,
    );
  }

  Collections fromJson(Map<String, Object?> json) {
    return Collections.fromJson(json);
  }
}

/// @nodoc
const $Collections = _$CollectionsTearOff();

/// @nodoc
mixin _$Collections {
  String get status => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  List<Collection> get col => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionsCopyWith<Collections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionsCopyWith<$Res> {
  factory $CollectionsCopyWith(
          Collections value, $Res Function(Collections) then) =
      _$CollectionsCopyWithImpl<$Res>;
  $Res call({String status, int totalResults, List<Collection> col});
}

/// @nodoc
class _$CollectionsCopyWithImpl<$Res> implements $CollectionsCopyWith<$Res> {
  _$CollectionsCopyWithImpl(this._value, this._then);

  final Collections _value;
  // ignore: unused_field
  final $Res Function(Collections) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? col = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      col: col == freezed
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
    ));
  }
}

/// @nodoc
abstract class _$CollectionsCopyWith<$Res>
    implements $CollectionsCopyWith<$Res> {
  factory _$CollectionsCopyWith(
          _Collections value, $Res Function(_Collections) then) =
      __$CollectionsCopyWithImpl<$Res>;
  @override
  $Res call({String status, int totalResults, List<Collection> col});
}

/// @nodoc
class __$CollectionsCopyWithImpl<$Res> extends _$CollectionsCopyWithImpl<$Res>
    implements _$CollectionsCopyWith<$Res> {
  __$CollectionsCopyWithImpl(
      _Collections _value, $Res Function(_Collections) _then)
      : super(_value, (v) => _then(v as _Collections));

  @override
  _Collections get _value => super._value as _Collections;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? col = freezed,
  }) {
    return _then(_Collections(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      col: col == freezed
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Collections implements _Collections {
  _$_Collections(
      {required this.status, required this.totalResults, required this.col});

  factory _$_Collections.fromJson(Map<String, dynamic> json) =>
      _$$_CollectionsFromJson(json);

  @override
  final String status;
  @override
  final int totalResults;
  @override
  final List<Collection> col;

  @override
  String toString() {
    return 'Collections(status: $status, totalResults: $totalResults, col: $col)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Collections &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults) &&
            const DeepCollectionEquality().equals(other.col, col));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(totalResults),
      const DeepCollectionEquality().hash(col));

  @JsonKey(ignore: true)
  @override
  _$CollectionsCopyWith<_Collections> get copyWith =>
      __$CollectionsCopyWithImpl<_Collections>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectionsToJson(this);
  }
}

abstract class _Collections implements Collections {
  factory _Collections(
      {required String status,
      required int totalResults,
      required List<Collection> col}) = _$_Collections;

  factory _Collections.fromJson(Map<String, dynamic> json) =
      _$_Collections.fromJson;

  @override
  String get status;
  @override
  int get totalResults;
  @override
  List<Collection> get col;
  @override
  @JsonKey(ignore: true)
  _$CollectionsCopyWith<_Collections> get copyWith =>
      throw _privateConstructorUsedError;
}
