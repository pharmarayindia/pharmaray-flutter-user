import 'dart:convert';

import 'package:pharmaray/lib.dart';

CartResponse cartResponseFromJson(String str) =>
    CartResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String cartResponseToJson(CartResponse data) => json.encode(data.toJson());

class CartResponse {
  CartResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        data: json['data'] != null
            ? List<Source>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) => Source.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final String? message;
  final int? statusCode;
  final List<Source>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}
