import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

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

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}