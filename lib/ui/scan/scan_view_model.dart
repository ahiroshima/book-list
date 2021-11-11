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

  Result<Book>? _scannedBook;
  ScanResult? _result;

  Result<Book>? get scannedBook => _scannedBook;
  ScanResult? get scanResult => _result;

  Future<void> searchBook() {
    return _repository
        .getBook()
        .then((value) => _scannedBook = value)
        .whenComplete(notifyListeners);
  }

  Future scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      _result = result;
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