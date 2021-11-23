import 'package:app/data/provider/firebase_auth_provider.dart';
import 'package:app/data/remote/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataSourceProviderForEmail =
    Provider((ref) => AuthDataSourceImplForEmail(ref.read));

class AuthDataSourceImplForEmail implements AuthDataSource {
  AuthDataSourceImplForEmail(this._reader);

  final Reader _reader;

  late final firebase.FirebaseAuth _firebaseAuth =
      _reader(firebaseAuthProvider);

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

  @override
  firebase.User? getCurrentUser() => _firebaseAuth.currentUser;

  @override
  Future<firebase.User?> signIn() async {
    try {
      firebase.UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: _email, password: _password);
      return credential.user;
    } catch (error) {
      return null;
    }
  }

  @override
  Future<void> signOut() {
    return GoogleSignIn()
        .signOut()
        .then((_) => _firebaseAuth.signOut())
        .catchError((error) {
      debugPrint(error.toString());
      throw error;
    });
  }
}
