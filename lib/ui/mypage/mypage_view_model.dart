import 'package:app/data/repository/books_repository.dart';
import 'package:app/data/repository/books_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mypageViewModelProvider =
    ChangeNotifierProvider((ref) => MypageViewModel(ref.read));

class MypageViewModel extends ChangeNotifier {
  MypageViewModel(this._reader);

  final Reader _reader;

  late final BooksRepository _repository = _reader(booksRepositoryProvider);

  final List<bool> _selected = [];
  List<bool> get selected => _selected;

  void initSelected(int count) {
    for (var i = 0; i < count; i++) {
      _selected.add(false);
    }
  }

  void setSelected(int index) {
    _selected[index] = !_selected[index];
  }

}
