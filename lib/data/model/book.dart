import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
abstract class Book with _$Book {
  factory Book({
    String? author,
    String? title,
    String? publisher,
    int? price
  }) = _Book;
}