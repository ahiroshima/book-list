import 'package:app/data/local/app_user.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/remote/auth_data_source.dart';
import 'package:app/data/remote/auth_data_source_impl_for_anonymous.dart';
import 'package:app/data/remote/auth_data_source_impl_for_google.dart';
import 'package:app/data/remote/auth_data_source_impl_for_email.dart';
import 'package:app/data/repository/auth_repository.dart';
import 'package:app/foundation/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(ref.read));

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._reader);

  final Reader _reader;

  late AuthDataSource _dataSource = _reader(authDataSourceProviderForAnonymous);

  AuthDataSource get dataSource => _dataSource;

  SignInMethod get signInMethod => _signInMethod;

  late final SignInMethod _signInMethod = SignInMethod.anonymous;

  @override
  AppUser getCurrentUser() {
    return AppUser.from(_dataSource.getCurrentUser());
  }

  @override
  Future<Result<AppUser>> signIn(SignInMethod signInMethod,
      [String? email, String? password]) {
    AuthDataSource dataSource;
    switch (signInMethod) {
      case SignInMethod.anonymous:
        dataSource = _reader(authDataSourceProviderForAnonymous);
        break;
      case SignInMethod.email:
        dataSource = _reader(authDataSourceProviderForEmail);
        (dataSource as AuthDataSourceImplForEmail).setEmail(email ?? '');
        dataSource.setPassword(password ?? '');
        break;
      case SignInMethod.google:
        dataSource = _reader(authDataSourceProviderForGoogle);
        break;
      default:
        dataSource = _reader(authDataSourceProviderForAnonymous);
        break;
    }
    _dataSource = dataSource;
    return Result.guardFuture(
        () async => AppUser.from(await _dataSource.signIn()));
  }

  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_dataSource.signOut);
  }
}
