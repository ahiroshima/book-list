import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';
import 'package:app/data/model/collection.dart';
import 'package:app/data/model/collections.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/books_repository.dart';
import 'package:app/data/repository/books_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final booksViewModelProvider =
    ChangeNotifierProvider((ref) => BooksViewModel(ref.read));

class BooksViewModel extends ChangeNotifier {
  BooksViewModel(this._reader);

  final Reader _reader;
  late final BooksRepository _repository = _reader(booksRepositoryProvider);

  Result<List<Books>>? _bookList;
  Result<List<Books>>? get bookList => _bookList;

  Result<Collections>? _collections;
  Result<Collections>? get collectios => _collections;

  Future<void> fetchBooks() {
    return _repository.getBooks().then((value) {
      _bookList = classifyBooks(value);
    }).whenComplete(() => notifyListeners);
  }

  Future<Book> getBook(id) {
    return _repository.getBook(id).then((value) => value.dataOrThrow);
  }

  Future<void> fetchCollections() {
    return _repository
        .getCollections()
        .then((value) => _collections = value)
        .whenComplete(notifyListeners);
  }

  Result<List<Books>> classifyBooks(allBooks) {
    List<Books> bookList = [];
    bookList.add(allBooks.dataOrThrow); // All

    // 0:All, 1:以降のコレクションを作成
    if (_collections != null) {
      for (int i = 1; i < _collections!.dataOrThrow.col.length; i++) {
        List<Book> filteredBooks = [];
        Collection collection = _collections!.dataOrThrow.col.elementAt(i);
        for (var colBook in collection.books) {
          for (var book in allBooks.dataOrThrow.books) {
            if (book.isbn == colBook) filteredBooks.add(book);
          }
        }
        bookList.add(Books(
            status: 'success',
            totalResults: filteredBooks.length,
            books: filteredBooks));
      }
    }
    return Result.success(data: bookList);
  }
}
