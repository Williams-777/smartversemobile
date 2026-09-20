import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/auth_response_model.dart';

class AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      await _apiClient.dio.post(ApiEndpoints.register, data: {
        'fullName': fullName,
        'email': email,
        'password': password,
      });
    } catch (e) {
      _apiClient.handleError(e);
    }
  }

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.dio.post(ApiEndpoints.login, data: {
        'email': email,
        'password': password,
      });
      final data = response.data['data'] as Map<String, dynamic>;
      return AuthResponseModel.fromJson(data);
    } catch (e) {
      _apiClient.handleError(e);
    }
  }
  Future<void> forgotPassword({required String email}) async {
    try {
      await _apiClient.dio.post(ApiEndpoints.forgotPassword, data: {'email': email});
    } catch (e) {
      _apiClient.handleError(e);
    }
  }

  Future<void> resendVerification({required String email}) async {
    try {
      await _apiClient.dio.post(ApiEndpoints.resendVerification, data: {'email': email});
    } catch (e) {
      _apiClient.handleError(e);
    }
  }

  Future<void> verifyEmail({required String token}) async {
    try {
      await _apiClient.dio.post(ApiEndpoints.verifyEmail, data: {'token': token});
    } catch (e) {
      _apiClient.handleError(e);
    }
  }
}