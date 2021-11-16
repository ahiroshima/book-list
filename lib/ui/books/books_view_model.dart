import 'package:app/data/model/books.dart';
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

  Result<Books>? _books;
  Result<Books>? get books => _books;

  Future<void> fetchBooks() {
    return _repository
        .getBooks()
        .then((value) => _books = value)
        .whenComplete(notifyListeners);
  }
}