import 'package:app/data/model/book.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/books_repository.dart';
import 'package:app/data/repository/books_repository_impl.dart';
import 'package:app/data/repository/search_book_repository.dart';
import 'package:app/data/repository/search_book_repository_impl.dart';
import 'package:app/ui/books/books_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final regViewModelProvider =
    ChangeNotifierProvider((ref) => RegViewModel(ref.read));

class RegViewModel extends ChangeNotifier {
  RegViewModel(this._reader);

  final Reader _reader;

  late final SearchBookRepository _repository =
      _reader(searchBookRepositoryProvider);
  late final BooksRepository _booksRepository =
      _reader(booksRepositoryProvider);
  late final booksViewModel = _reader(booksViewModelProvider);

  ScanResult? _result;
  ScanResult? get scanResult => _result;

  Result<Book>? _bookInfo;
  Result<Book>? get bookInfo => _bookInfo;

  Future<void> addBook() {
    return _booksRepository
        .addBook(_bookInfo!.dataOrThrow)
        .whenComplete(booksViewModel.fetchBooks);
  }

  Future<void> scanBarcode() async {
    var _options = const ScanOptions(
      strings: {
        'cancel': 'Cancel',
        'flash_on': 'Flash On',
        'flash_off': 'Flash Off',
      },
      autoEnableFlash: false,
      android: AndroidOptions(aspectTolerance: 0.00, useAutoFocus: true),
    );

    while (true) {
      try {
        final result = await BarcodeScanner.scan(options: _options);
        _result = result;
        _bookInfo = null;
        if (result.type == ResultType.Barcode && isIsdnCode(result)) {
          _repository
              .getBook(result.rawContent)
              .then((value) => _bookInfo = value)
              .whenComplete(notifyListeners);
          break;
        } else if(result.type == ResultType.Cancelled) {
          break;
        }
      } on PlatformException catch (e) {
        _result = ScanResult(
            type: ResultType.Error,
            format: BarcodeFormat.unknown,
            rawContent: e.code == BarcodeScanner.cameraAccessDenied
                ? 'No camera permission!'
                : 'Unknown error: $e');
      }
    }
  }

  bool isIsdnCode(ScanResult barcode) {
    if (barcode.rawContent.toString().startsWith('978') ||
        barcode.rawContent.toString().startsWith('979')) {
      return true;
    } else {
      return false;
    }
  }
}
