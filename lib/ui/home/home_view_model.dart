import 'package:app/ui/registration/reg_view_model.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);

  final Reader _reader;
  bool _fabVisible = true;

  bool get isVisibleFab => _fabVisible;

  ScanResult? _scanResult;
  ScanResult? get scanResult => _scanResult;

  late final RegViewModel _registrationViewModel = 
    _reader(regViewModelProvider);


  Future<void> scanBarcode() async {
    await _registrationViewModel.scanBarcode();
    _scanResult = _registrationViewModel.scanResult;
  }

  void setVisibleFab(bool visible) {
    _fabVisible = visible;
  }
}
