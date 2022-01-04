import 'package:app/data/model/book.dart';
import 'package:app/data/repository/books_repository.dart';
import 'package:app/data/repository/books_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final detailPageViewModelProvider =
    ChangeNotifierProvider((ref) => DetailPageViewModel(ref.read));

class DetailPageViewModel extends ChangeNotifier {
  DetailPageViewModel(this._reader);

  final Reader _reader;

  late final BooksRepository _repository = _reader(booksRepositoryProvider);

  String _memo = '';
  String get memo => _memo;

  late Book _book;
  Book get book => _book;

  void setbook(Book book) {
    _book = book;
    _memo = book.memo.toString();
  }

  void saveMemo(String memo) {
    Book newBook = _book.copyWith(memo: memo);
    _repository.updateBook(newBook);
    _book = newBook;
    _memo = memo;
  }
}
