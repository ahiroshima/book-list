import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
abstract class Book with _$Book {
  factory Book({
    String? title,
    String? author,
    String? urlToLargeImage,
    String? urlToMediumImage,
    String? urlToDetailPage,
    String? publisher,
    String? publicationDate,
    String? price
  }) = _Book;
}