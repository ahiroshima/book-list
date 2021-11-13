import 'package:app/data/model/book.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/search_book_repository.dart';
import 'package:app/data/repository/search_book_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

final scanViewModelProvider =
    ChangeNotifierProvider((ref) => ScanViewModel(ref.read));

class ScanViewModel extends ChangeNotifier {
  ScanViewModel(this._reader);

  final Reader _reader;

  late final SearchBookRepository _repository = _reader(searchBookRepositoryProvider);

  ScanResult? _result;
  ScanResult? get scanResult => _result;

  Result<Book>? _bookInfo;
  Result<Book>? get bookInfo => _bookInfo;


  Future<void> searchBook(String barcode) {
    final isbn = barcode;
    return _repository
      .getBook(isbn)
      .then((value) => _bookInfo = value)
      .whenComplete(notifyListeners);
  }

  Future<void> scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      _result = result;
      if(result.rawContent.toString().startsWith('978') ||
          result.rawContent.toString().startsWith('979')) {
        _repository
          .getBook(result.rawContent)
          .then((value) => _bookInfo = value)
          .whenComplete(notifyListeners);
      }
    } on PlatformException catch (e) {
      _result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
          ? 'No camera permission!'
          : 'Unknown error: $e');
    }
    //notifyListeners();
  }
}