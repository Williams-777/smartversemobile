import '../../../../core/network/token_storage.dart';
import '../dataSource/auth_remote_data_source.dart';
import '../models/auth_response_model.dart';
import '../models/user_response_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final TokenStorage _tokenStorage;

  AuthRepository(this._remoteDataSource, this._tokenStorage);

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    String? userType,
    String? state,
    String? phoneNumber,
  }) {
    return _remoteDataSource.register(
      fullName: fullName,
      email: email,
      password: password,
      userType: userType,
      state: state,
      phoneNumber: phoneNumber,
    );
  }

  /// Logs in, persists the tokens, then fetches the profile (the login
  /// payload itself only carries tokens + verification status now) and
  /// persists the user's name/email alongside them.
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final authResponse =
    await _remoteDataSource.login(email: email, password: password);

    await _tokenStorage.setTokens(
      accessToken: authResponse.accessToken,
      refreshToken: authResponse.refreshToken,
    );

    final profile = await _remoteDataSource.getProfile();
    await _tokenStorage.setUserInfo(
      fullName: profile.fullName,
      email: profile.email,
      isEmailVerified: profile.isEmailVerified,
    );

    return authResponse;
  }

  Future<UserResponseModel> getProfile() {
    return _remoteDataSource.getProfile();
  }

  Future<void> forgotPassword({required String email}) {
    return _remoteDataSource.forgotPassword(email: email);
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) {
    return _remoteDataSource.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );
  }

  Future<void> resendVerification({required String email}) {
    return _remoteDataSource.resendVerification(email: email);
  }

  Future<void> verifyEmail({required String email, required String otp}) {
    return _remoteDataSource.verifyEmail(email: email, otp: otp);
  }

  /// Deletes the signed-in user's account on the server, then clears the
  /// locally stored tokens/profile so the app drops back to signed-out.
  Future<void> deleteAccount() async {
    await _remoteDataSource.deleteAccount();
    await _tokenStorage.clear();
  }

  /// No backend endpoint exists yet to persist profile edits (see the
  /// note in AuthRemoteDataSource), so this only updates the locally
  /// cached name — it does NOT reach the server, and will be overwritten
  /// the next time getProfile()/login() run. Swap this out once
  /// PATCH /api/v1/user/profile (or similar) exists.
  Future<void> updateLocalName(String fullName) async {
    await _tokenStorage.setUserInfo(
      fullName: fullName,
      email: _tokenStorage.email ?? '',
      isEmailVerified: _tokenStorage.isEmailVerified,
    );
  }
}