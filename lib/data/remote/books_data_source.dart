import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';

abstract class BooksDataSource {
  Future<Books> getBooks();
  Future<void> addBook(Book book);
}