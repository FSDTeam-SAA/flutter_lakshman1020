class UpdateProfileResponseModel {
  final String avatar;
  final VerificationInfo verificationInfo;
  final String id;
  final String name;
  final String email;
  final String role;
  final String stripeAccountId;
  final bool isStripeOnboarded;
  final String passwordResetToken;
  final String refreshToken;
  final String createdAt;
  final String updatedAt;
  final String address;
  final String phone;
  final String nationality;

  UpdateProfileResponseModel({
    required this.avatar,
    required this.verificationInfo,
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.stripeAccountId,
    required this.isStripeOnboarded,
    required this.passwordResetToken,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
    required this.phone,
    required this.nationality
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      avatar: json['avatar'] ?? '',
      verificationInfo: VerificationInfo.fromJson(json['verificationInfo'] ?? {}),
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      stripeAccountId: json['stripeAccountId'] ?? '',
      isStripeOnboarded: json['isStripeOnboarded'] ?? false,
      passwordResetToken: json['password_reset_token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      nationality: json['nationality'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'verificationInfo': verificationInfo.toJson(),
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'stripeAccountId': stripeAccountId,
      'isStripeOnboarded': isStripeOnboarded,
      'password_reset_token': passwordResetToken,
      'refreshToken': refreshToken,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'address': address,
      'phone': phone,
    };
  }
}

class VerificationInfo {
  final bool verified;
  final String token;

  VerificationInfo({
    required this.verified,
    required this.token,
  });

  factory VerificationInfo.fromJson(Map<String, dynamic> json) {
    return VerificationInfo(
      verified: json['verified'] ?? false,
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verified': verified,
      'token': token,
    };
  }
}
