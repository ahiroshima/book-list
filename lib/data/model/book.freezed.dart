// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call({String? author, String? title, String? publisher, int? price}) {
    return _Book(
      author: author,
      title: title,
      publisher: publisher,
      price: price,
    );
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
  String? get author => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call({String? author, String? title, String? publisher, int? price});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? publisher = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) then) =
      __$BookCopyWithImpl<$Res>;
  @override
  $Res call({String? author, String? title, String? publisher, int? price});
}

/// @nodoc
class __$BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(_Book _value, $Res Function(_Book) _then)
      : super(_value, (v) => _then(v as _Book));

  @override
  _Book get _value => super._value as _Book;

  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? publisher = freezed,
    Object? price = freezed,
  }) {
    return _then(_Book(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Book implements _Book {
  _$_Book({this.author, this.title, this.publisher, this.price});

  @override
  final String? author;
  @override
  final String? title;
  @override
  final String? publisher;
  @override
  final int? price;

  @override
  String toString() {
    return 'Book(author: $author, title: $title, publisher: $publisher, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Book &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.publisher, publisher) ||
                const DeepCollectionEquality()
                    .equals(other.publisher, publisher)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(publisher) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);
}

abstract class _Book implements Book {
  factory _Book(
      {String? author, String? title, String? publisher, int? price}) = _$_Book;

  @override
  String? get author => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get publisher => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}
