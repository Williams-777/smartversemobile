import '../../../../core/network/token_storage.dart';
import '../dataSource/auth_remote_data_source.dart';
import '../models/auth_response_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final TokenStorage _tokenStorage;

  AuthRepository(this._remoteDataSource, this._tokenStorage);

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) {
    return _remoteDataSource.register(
      fullName: fullName,
      email: email,
      password: password,
    );
  }

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final authResponse =
    await _remoteDataSource.login(email: email, password: password);
    await _tokenStorage.setTokens(
      accessToken: authResponse.accessToken,
      refreshToken: authResponse.refreshToken,
      fullName: authResponse.fullName,
      email: authResponse.email,
    );

    return authResponse;
  }

  Future<void> forgotPassword({required String email}) {
    return _remoteDataSource.forgotPassword(email: email);
  }

  Future<void> resendVerification({required String email}) {
    return _remoteDataSource.resendVerification(email: email);
  }
  Future<void> verifyEmail({required String token}) {
    return _remoteDataSource.verifyEmail(token: token);
  }
}