import 'package:app/data/model/books.dart';
import 'package:app/data/model/book.dart';
import 'package:app/data/model/collections.dart';
import 'package:app/data/model/result.dart';

abstract class BooksRepository {
  Future<Result<Books>> getBooks();
  Future<Result<Book>> getBook(String id);
  Future<Result<Collections>> getCollections();
  Future<Result<void>> addBook(Book book);
  Future<Result<void>> updateBook(Book book);
}
