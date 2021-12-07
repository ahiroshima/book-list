import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';
import 'package:app/data/model/collections.dart';
import 'package:app/data/remote/books_data_source.dart';

import '../dummy/dummy_books.dart';
import '../dummy/dummy_collections.dart';

class FakeBooksDataSourceImpl implements BooksDataSource {
  @override
  Future<Books> getBooks() async {
    // return dummy data.
    return dummyBooks;
  }

  @override
  Future<Collections> getCollections() async {
    // return dummy data.
    return dummyCollections;
  }

  @override
  Future<void> addBook(Book book) async {
    return;
  }
}