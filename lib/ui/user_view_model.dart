import 'package:app/data/local/app_user.dart';
import 'package:app/data/repository/auth_repository.dart';
import 'package:app/data/repository/auth_repository_impl.dart';
import 'package:app/foundation/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userViewModelProvider =
    ChangeNotifierProvider((ref) => UserViewModel(ref.read));

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._reader);

  final Reader _reader;

  late final AuthRepository _repository = _reader(authRepositoryProvider);

  AppUser? _user;

  AppUser? get user => _user;

  bool get isAuthenticated => _user != null;

  String _email = '';
  String _password = '';
  String get email => _email;
  String get password => _password;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  AppUser getCurrentUser() {
    AppUser currentUser = _repository.getCurrentUser();
    if (_user == null || _user?.userId == null) {
      _user = currentUser;
    }
    return currentUser;
  }

  Future<void> signIn(SignInMethod signInMethod) {
    return _repository.signIn(signInMethod, _email, _password).then((result) {
      result.ifSuccess((data) {
        _user = data;
        notifyListeners();
      });
    });
  }

  Future signOut() {
    return _repository.signOut().then((result) {
      return result.when(
        success: (_) {
          _user = null;
          notifyListeners();
        },
        failure: (_) => result,
      );
    });
  }
}
