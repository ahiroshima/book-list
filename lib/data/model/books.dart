import 'package:app/data/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'books.freezed.dart';

@freezed
abstract class Books with _$Books {
  factory Books({
    required String status,
    required int totalResults,
    required List<Book> books,
  }) = _Books;
}