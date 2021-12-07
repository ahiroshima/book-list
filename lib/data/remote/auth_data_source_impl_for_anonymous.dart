import 'package:app/data/provider/firebase_auth_provider.dart';
import 'package:app/data/remote/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataSourceProviderForAnonymous =
    Provider((ref) => AuthDataSourceImplAnonymous(ref.read));

class AuthDataSourceImplAnonymous implements AuthDataSource {
  AuthDataSourceImplAnonymous(this._reader);

  final Reader _reader;

  late final firebase.FirebaseAuth _firebaseAuth =
      _reader(firebaseAuthProvider);

  @override
  firebase.User? getCurrentUser() => _firebaseAuth.currentUser;

  @override
  Future<firebase.User?> signIn() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } on firebase.FirebaseAuthException catch (e) {
      return throw StateError(
          'Maybe Anonymounns SingIn is NOT allowed. ${e.message}');
    }

    final currentUser = _firebaseAuth.currentUser;
    return currentUser;
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      // サインアウトしたら新たに匿名ユーザーでサインインする
      await signIn();
    } on firebase.FirebaseAuthException catch (e) {
      throw StateError('Maybe Anonymounns SingIn is NOT allowed. ${e.message}');
    }
  }
}
