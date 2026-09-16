import 'package:dio/dio.dart';
import 'package:smartversemobile/core/network/token_storage.dart';

import '../error/exceptions.dart';


class ApiClient {
  static final ApiClient instance = ApiClient._();

  static const baseUrl = "https://smart-vert-app.onrender.com/api/v1";

  late final Dio dio;

  ApiClient._() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = TokenStorage.instance.accessToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }

  Never handleError(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:

        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          throw const NetworkException();

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final message = _extractMessage(error.response?.data) ??
              'Something went wrong. Please try again.';
          throw ServerException(message, statusCode: statusCode);

        case DioExceptionType.cancel:
          throw const NetworkException('Request was cancelled');

        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          throw const NetworkException();
        case DioExceptionType.transformTimeout:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    }

    if (error is TypeError || error is FormatException) {
      throw const ParsingException();
    }

    throw ServerException(error.toString());
  }

  String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ?? data['error'] as String?;
    }
    return null;
  }

}