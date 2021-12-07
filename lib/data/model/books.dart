import 'package:app/data/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'books.freezed.dart';
part 'books.g.dart';

@freezed
abstract class Books with _$Books {
  factory Books({
    required String status,
    required int totalResults,
    required List<Book> books,
  }) = _Books;

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);
}
