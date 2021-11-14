import 'package:app/data/model/book.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/search_book_repository.dart';
import 'package:app/data/repository/search_book_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

final homeViewModelProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);

  final Reader _reader;

  late final SearchBookRepository _searchBookRepository = _reader(searchBookRepositoryProvider);

  ScanResult? _scanResult;
  ScanResult? get scanResult => _scanResult;

  Result<Book>? _searchBookInfo;
  Result<Book>? get searchBookInfo => _searchBookInfo;

  Future<void> scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      _scanResult = result;
      if(result.rawContent.toString().startsWith('978') ||
          result.rawContent.toString().startsWith('979')) {
        _searchBookRepository
          .getBook(result.rawContent)
          .then((value) => _searchBookInfo = value)
          .whenComplete(notifyListeners);
      }
    } on PlatformException catch (e) {
      _scanResult = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
          ? 'No camera permission!'
          : 'Unknown error: $e');
    }
  }
}
