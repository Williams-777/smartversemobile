
/// Thrown when the server responds with an error status (400, 401, 500...).
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

/// Thrown when there's no internet, or the request times out.
class NetworkException implements Exception {
  final String message;

  const NetworkException([this.message = 'No internet connection']);

  @override
  String toString() => message;
}

/// Thrown when the server sends back something we can't parse.
class ParsingException implements Exception {
  final String message;

  const ParsingException([this.message = 'Unexpected response from server']);

  @override
  String toString() => message;
}