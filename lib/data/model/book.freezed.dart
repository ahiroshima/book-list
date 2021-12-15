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

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call(
      {String? isbn,
      String? title,
      String? subtitle,
      List<dynamic>? authors,
      String? publishedDate,
      String? description,
      int? pageCount,
      List<dynamic>? categories,
      String? smallThumbnail,
      String? thumbnail,
      String? urlToDetailPage,
      String? publisher,
      String? price}) {
    return _Book(
      isbn: isbn,
      title: title,
      subtitle: subtitle,
      authors: authors,
      publishedDate: publishedDate,
      description: description,
      pageCount: pageCount,
      categories: categories,
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
      urlToDetailPage: urlToDetailPage,
      publisher: publisher,
      price: price,
    );
  }

  Book fromJson(Map<String, Object?> json) {
    return Book.fromJson(json);
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
//Map? identifiers,
  String? get isbn => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  List<dynamic>? get authors => throw _privateConstructorUsedError;
  String? get publishedDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get pageCount => throw _privateConstructorUsedError;
  List<dynamic>? get categories => throw _privateConstructorUsedError;
  String? get smallThumbnail => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get urlToDetailPage => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call(
      {String? isbn,
      String? title,
      String? subtitle,
      List<dynamic>? authors,
      String? publishedDate,
      String? description,
      int? pageCount,
      List<dynamic>? categories,
      String? smallThumbnail,
      String? thumbnail,
      String? urlToDetailPage,
      String? publisher,
      String? price});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? isbn = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? authors = freezed,
    Object? publishedDate = freezed,
    Object? description = freezed,
    Object? pageCount = freezed,
    Object? categories = freezed,
    Object? smallThumbnail = freezed,
    Object? thumbnail = freezed,
    Object? urlToDetailPage = freezed,
    Object? publisher = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      publishedDate: publishedDate == freezed
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: pageCount == freezed
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      smallThumbnail: smallThumbnail == freezed
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToDetailPage: urlToDetailPage == freezed
          ? _value.urlToDetailPage
          : urlToDetailPage // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) then) =
      __$BookCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? isbn,
      String? title,
      String? subtitle,
      List<dynamic>? authors,
      String? publishedDate,
      String? description,
      int? pageCount,
      List<dynamic>? categories,
      String? smallThumbnail,
      String? thumbnail,
      String? urlToDetailPage,
      String? publisher,
      String? price});
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
    Object? isbn = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? authors = freezed,
    Object? publishedDate = freezed,
    Object? description = freezed,
    Object? pageCount = freezed,
    Object? categories = freezed,
    Object? smallThumbnail = freezed,
    Object? thumbnail = freezed,
    Object? urlToDetailPage = freezed,
    Object? publisher = freezed,
    Object? price = freezed,
  }) {
    return _then(_Book(
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      publishedDate: publishedDate == freezed
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: pageCount == freezed
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      smallThumbnail: smallThumbnail == freezed
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToDetailPage: urlToDetailPage == freezed
          ? _value.urlToDetailPage
          : urlToDetailPage // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book implements _Book {
  _$_Book(
      {this.isbn,
      this.title,
      this.subtitle,
      this.authors,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.categories,
      this.smallThumbnail,
      this.thumbnail,
      this.urlToDetailPage,
      this.publisher,
      this.price});

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override //Map? identifiers,
  final String? isbn;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final List<dynamic>? authors;
  @override
  final String? publishedDate;
  @override
  final String? description;
  @override
  final int? pageCount;
  @override
  final List<dynamic>? categories;
  @override
  final String? smallThumbnail;
  @override
  final String? thumbnail;
  @override
  final String? urlToDetailPage;
  @override
  final String? publisher;
  @override
  final String? price;

  @override
  String toString() {
    return 'Book(isbn: $isbn, title: $title, subtitle: $subtitle, authors: $authors, publishedDate: $publishedDate, description: $description, pageCount: $pageCount, categories: $categories, smallThumbnail: $smallThumbnail, thumbnail: $thumbnail, urlToDetailPage: $urlToDetailPage, publisher: $publisher, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Book &&
            const DeepCollectionEquality().equals(other.isbn, isbn) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality()
                .equals(other.publishedDate, publishedDate) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.pageCount, pageCount) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.smallThumbnail, smallThumbnail) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality()
                .equals(other.urlToDetailPage, urlToDetailPage) &&
            const DeepCollectionEquality().equals(other.publisher, publisher) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isbn),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(authors),
      const DeepCollectionEquality().hash(publishedDate),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(pageCount),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(smallThumbnail),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(urlToDetailPage),
      const DeepCollectionEquality().hash(publisher),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(this);
  }
}

abstract class _Book implements Book {
  factory _Book(
      {String? isbn,
      String? title,
      String? subtitle,
      List<dynamic>? authors,
      String? publishedDate,
      String? description,
      int? pageCount,
      List<dynamic>? categories,
      String? smallThumbnail,
      String? thumbnail,
      String? urlToDetailPage,
      String? publisher,
      String? price}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override //Map? identifiers,
  String? get isbn;
  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  List<dynamic>? get authors;
  @override
  String? get publishedDate;
  @override
  String? get description;
  @override
  int? get pageCount;
  @override
  List<dynamic>? get categories;
  @override
  String? get smallThumbnail;
  @override
  String? get thumbnail;
  @override
  String? get urlToDetailPage;
  @override
  String? get publisher;
  @override
  String? get price;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}
