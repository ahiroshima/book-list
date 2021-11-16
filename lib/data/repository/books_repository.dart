import 'package:app/data/model/books.dart';
import 'package:app/data/model/book.dart';
import 'package:app/data/model/result.dart';

abstract class BooksRepository {
  Future<Result<Books>> getBooks();
  Future<Result<void>> addBook(Book book);
}