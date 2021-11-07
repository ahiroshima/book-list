// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'books.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BooksTearOff {
  const _$BooksTearOff();

  _Books call(
      {required String status,
      required int totalResults,
      required List<Book> articles}) {
    return _Books(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }
}

/// @nodoc
const $Books = _$BooksTearOff();

/// @nodoc
mixin _$Books {
  String get status => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  List<Book> get articles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BooksCopyWith<Books> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksCopyWith<$Res> {
  factory $BooksCopyWith(Books value, $Res Function(Books) then) =
      _$BooksCopyWithImpl<$Res>;
  $Res call({String status, int totalResults, List<Book> articles});
}

/// @nodoc
class _$BooksCopyWithImpl<$Res> implements $BooksCopyWith<$Res> {
  _$BooksCopyWithImpl(this._value, this._then);

  final Books _value;
  // ignore: unused_field
  final $Res Function(Books) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
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
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
abstract class _$BooksCopyWith<$Res> implements $BooksCopyWith<$Res> {
  factory _$BooksCopyWith(_Books value, $Res Function(_Books) then) =
      __$BooksCopyWithImpl<$Res>;
  @override
  $Res call({String status, int totalResults, List<Book> articles});
}

/// @nodoc
class __$BooksCopyWithImpl<$Res> extends _$BooksCopyWithImpl<$Res>
    implements _$BooksCopyWith<$Res> {
  __$BooksCopyWithImpl(_Books _value, $Res Function(_Books) _then)
      : super(_value, (v) => _then(v as _Books));

  @override
  _Books get _value => super._value as _Books;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_Books(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$_Books implements _Books {
  _$_Books(
      {required this.status,
      required this.totalResults,
      required this.articles});

  @override
  final String status;
  @override
  final int totalResults;
  @override
  final List<Book> articles;

  @override
  String toString() {
    return 'Books(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Books &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.totalResults, totalResults) ||
                const DeepCollectionEquality()
                    .equals(other.totalResults, totalResults)) &&
            (identical(other.articles, articles) ||
                const DeepCollectionEquality()
                    .equals(other.articles, articles)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(totalResults) ^
      const DeepCollectionEquality().hash(articles);

  @JsonKey(ignore: true)
  @override
  _$BooksCopyWith<_Books> get copyWith =>
      __$BooksCopyWithImpl<_Books>(this, _$identity);
}

abstract class _Books implements Books {
  factory _Books(
      {required String status,
      required int totalResults,
      required List<Book> articles}) = _$_Books;

  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get totalResults => throw _privateConstructorUsedError;
  @override
  List<Book> get articles => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BooksCopyWith<_Books> get copyWith => throw _privateConstructorUsedError;
}
