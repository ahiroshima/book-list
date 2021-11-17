import 'package:app/ui/registration/registration_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);

  final Reader _reader;

  late final RegistrationViewModel _registrationViewModel = 
    _reader(registrationViewModelProvider);


  Future<void> scanBarcode() async {
    _registrationViewModel.scanBarcode();
  }
}
