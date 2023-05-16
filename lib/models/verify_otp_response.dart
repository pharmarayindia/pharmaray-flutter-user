import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) =>
    VerifyOtpResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String verifyOtpResponseToJson(VerifyOtpResponse data) =>
    json.encode(data.toJson());

class VerifyOtpResponse {
  VerifyOtpResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        data: VerifyOtpData.fromJson(json['data'] as Map<String, dynamic>),
      );

  final String? message;
  final int? statusCode;
  final VerifyOtpData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'statusCode': statusCode,
        'data': data,
      };
}

class VerifyOtpData {
  VerifyOtpData({
    this.id,
    this.fullName,
    this.age,
    this.dob,
    this.mobile,
    this.email,
    this.password,
    this.status,
    this.role,
    this.isDeleted,
    this.isProfileCompleted,
    this.referralCode,
    this.referredCode,
    this.city,
    this.area,
    this.createdAt,
    this.updatedAt,
    this.latLon,
    this.accessToken,
  });

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) => VerifyOtpData(
        id: json['id'] as int? ?? 0,
        fullName: json['fullName'],
        age: json['age'] as int? ?? 0,
        dob: json['dob'],
        mobile: json['mobile'] as String? ?? '',
        email: json['email'],
        password: json['password'] as String? ?? '',
        status: json['status'] as int? ?? 0,
        role: json['role'] as int? ?? 0,
        isDeleted: json['isDeleted'] as bool? ?? false,
        isProfileCompleted: json['isProfileCompleted'] as bool? ?? false,
        referralCode: json['referralCode'] as String? ?? '',
        referredCode: json['referredCode'],
        city: json['city'],
        area: json['area'],
        createdAt: json['createdAt'] as String? ?? '',
        updatedAt: json['updatedAt'] as String? ?? '',
        latLon: json['latLon'],
        accessToken: json['accessToken'] as String? ?? '',
      );

  final int? id;
  final dynamic fullName;
  final int? age;
  final dynamic dob;
  final String? mobile;
  final dynamic email;
  final String? password;
  final int? status;
  final int? role;
  final bool? isDeleted;
  final bool? isProfileCompleted;
  final String? referralCode;
  final dynamic referredCode;
  final dynamic city;
  final dynamic area;
  final String? createdAt;
  final String? updatedAt;
  final dynamic latLon;
  final String? accessToken;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'fullName': fullName,
        'age': age,
        'dob': dob,
        'mobile': mobile,
        'email': email,
        'password': password,
        'status': status,
        'role': role,
        'isDeleted': isDeleted,
        'isProfileCompleted': isProfileCompleted,
        'referralCode': referralCode,
        'referredCode': referredCode,
        'city': city,
        'area': area,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'latLon': latLon,
        'accessToken': accessToken,
      };
}
