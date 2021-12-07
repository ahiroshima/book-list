import 'package:app/data/local/app_user.dart';
import 'package:app/data/model/result.dart';
import 'package:app/foundation/constants.dart';

abstract class AuthRepository {
  Future<Result<AppUser>> signIn(SignInMethod signInMethod,
      [String? email, String? password]);

  Future<Result<void>> signOut();

  AppUser getCurrentUser();
}
