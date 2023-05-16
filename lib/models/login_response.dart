import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'],
        statusCode: json['statusCode'] as int? ?? 0,
        data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      );

  final dynamic message;
  final int? statusCode;
  final LoginData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'statusCode': statusCode,
        'data': data,
      };
}

class LoginData {
  LoginData({
    this.otp,
    this.mobile,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdAt,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        otp: json['otp'] as String? ?? '',
        mobile: json['mobile'] as String? ?? '',
        id: json['id'] as int? ?? 0,
        isActive: json['isActive'] as bool? ?? false,
        isDeleted: json['isDeleted'] as bool? ?? false,
        createdAt: json['createdAt'] as String? ?? '',
      );

  final String? otp;
  final String? mobile;
  final int? id;
  final bool? isActive;
  final bool? isDeleted;
  final String? createdAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'otp': otp,
        'mobile': mobile,
        'id': id,
        'isActive': isActive,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
      };
}
