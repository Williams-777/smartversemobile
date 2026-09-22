class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final bool isEmailVerified;

  const AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.isEmailVerified,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
    );
  }
}