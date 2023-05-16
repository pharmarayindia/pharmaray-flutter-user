// To parse this JSON data, do
//
//     final transactionsResponse = transactionsResponseFromJson(jsonString);

import 'dart:convert';

TransactionsResponse transactionsResponseFromJson(String str) =>
    TransactionsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String transactionsResponseToJson(TransactionsResponse data) =>
    json.encode(data.toJson());

class TransactionsResponse {
  TransactionsResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      TransactionsResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        data: json['data'] == null
            ? null
            : TransactionsData.fromJson(json['data'] as Map<String, dynamic>),
      );

  final String? message;
  final int? statusCode;
  final TransactionsData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}

class TransactionsData {
  TransactionsData({
    this.orderId,
    this.amount,
    this.paymentMode,
    this.paymentResponse,
    this.userId,
    this.id,
    this.paymentStatus,
  });

  factory TransactionsData.fromJson(Map<String, dynamic> json) =>
      TransactionsData(
        orderId: json['orderId'] as int? ?? 0,
        amount: json['amount'] as int? ?? 0,
        paymentMode: json['paymentMode'] as String? ?? '',
        paymentResponse: json['paymentResponse'] as String? ?? '',
        userId: json['userId'] as int? ?? 0,
        id: json['id'] as int? ?? 0,
        paymentStatus: json['paymentStatus'] as String? ?? '',
      );

  final int? orderId;
  final int? amount;
  final String? paymentMode;
  final String? paymentResponse;
  final int? userId;
  final int? id;
  final String? paymentStatus;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderId': orderId == null ? null : orderId,
        'amount': amount == null ? null : amount,
        'paymentMode': paymentMode == null ? null : paymentMode,
        'paymentResponse': paymentResponse == null ? null : paymentResponse,
        'userId': userId == null ? null : userId,
        'id': id == null ? null : id,
        'paymentStatus': paymentStatus == null ? null : paymentStatus,
      };
}
