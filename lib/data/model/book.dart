import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
abstract class Book with _$Book {
  factory Book({
    //Map? identifiers,
    String? isbn,
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
    String? price
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => bookConverter.fromJson(json);

  static const bookConverter = BookConverter();
}

class BookConverter implements JsonConverter<Book, Map<String, dynamic>> {

  const BookConverter();

  @override
  Book fromJson(Map<String, dynamic> json) {
    int totalItems = json['totalItems'] ?? 0;
    if(totalItems > 0) {
      // ここに変換方法を指定
      return _$_Book(
        //identifiers: json['items'][0]['volumeInfo']['industryIdentifiers'],
        isbn: json['items'][0]['volumeInfo']['industryIdentifiers'][1]['identifier'] as String,
        title: json['items'][0]['volumeInfo']['title'] as String,
        subtitle: json['items'][0]['volumeInfo']['subtitle'] ?? '' as String,
        authors: json['items'][0]['volumeInfo']['authors'] ?? [],
        publishedDate: json['items'][0]['volumeInfo']['publishedDate'] as String,
        description: json['items'][0]['volumeInfo']['description'] ?? '' as String,
        pageCount: json['items'][0]['volumeInfo']['pageCount'] as int,
        categories: json['items'][0]['volumeInfo']['categories'] ?? [],
        smallThumbnail: json['items'][0]['volumeInfo']['imageLinks'] != null
          ? json['items'][0]['volumeInfo']['imageLinks']['smallThumbnail'] as String
          : '',
        thumbnail: json['items'][0]['volumeInfo']['imageLinks'] != null
          ? json['items'][0]['volumeInfo']['imageLinks']['thumbnail'] as String
          : '',
      );
    }else {
      return _$_Book();
    };
  }

  @override
  Map<String, dynamic> toJson(Book data) => data.toJson();
}