import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';
import 'package:app/data/model/collections.dart';

abstract class BooksDataSource {
  Future<Books> getBooks();
  Future<Book> getBook(String id);
  Future<Collections> getCollections();
  Future<void> addBook(Book book);
  Future<void> updateBook(Book book);
}
