class FetchProfileResponseModel{
  final String id;
  final String name;
  final String email;
  final String role;
  final bool isStripeOnboarded;
  final String stripeAccountId;
  final Avatar avatar;
  final Address address;
  final VerificationInfo verificationInfo;
  final String refreshToken;
  final String accessToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  FetchProfileResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.isStripeOnboarded,
    required this.stripeAccountId,
    required this.avatar,
    required this.address,
    required this.verificationInfo,
    required this.refreshToken,
    required this.accessToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FetchProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return FetchProfileResponseModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      isStripeOnboarded: json['isStripeOnboarded'] ?? false,
      stripeAccountId: json['stripeAccountId'] ?? '',
      avatar: Avatar.fromJson(json['avatar'] ?? {}),
      address: Address.fromJson(json['address'] ?? {}),
      verificationInfo:
      VerificationInfo.fromJson(json['verificationInfo'] ?? {}),
      refreshToken: json['refreshToken'] ?? '',
      accessToken: json['accessToken'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'isStripeOnboarded': isStripeOnboarded,
      'stripeAccountId': stripeAccountId,
      'avatar': avatar.toJson(),
      'address': address.toJson(),
      'verificationInfo': verificationInfo.toJson(),
      'refreshToken': refreshToken,
      'accessToken': accessToken,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Avatar {
  final String publicId;
  final String url;

  Avatar({
    required this.publicId,
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      publicId: json['public_id'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'public_id': publicId,
      'url': url,
    };
  }
}

class Address {
  final String street;
  final String city;
  final String state;
  final String zipCode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zipCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
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
