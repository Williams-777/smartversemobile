class UserResponseModel {
  final String id;
  final String email;
  final String fullName;
  final String? userType;
  final String? state;
  final String? phoneNumber;
  final bool isEmailVerified;

  const UserResponseModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.userType,
    this.state,
    this.phoneNumber,
    required this.isEmailVerified,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      userType: json['userType'] as String?,
      state: json['state'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
    );
  }
}