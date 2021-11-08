import 'package:app/data/model/books.dart';

abstract class BooksDataSource {
  Future<Books> getBooks();
}