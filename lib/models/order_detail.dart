// To parse this JSON data, do
//
//     final orderDetailsResponse = orderDetailsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:pharmaray/lib.dart';

OrderDetailsResponse orderDetailsResponseFromJson(String str) =>
    OrderDetailsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String orderDetailsResponseToJson(OrderDetailsResponse data) =>
    json.encode(data.toJson());

class OrderDetailsResponse {
  OrderDetailsResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailsResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as num? ?? 0,
        data: json['data'] == null
            ? null
            : OrderDetailData.fromJson(json['data'] as Map<String, dynamic>),
      );

  final String? message;
  final num? statusCode;
  final OrderDetailData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}

class OrderDetailData {
  OrderDetailData({
    this.id,
    this.code,
    this.status,
    this.createdAt,
    this.orderAddress,
    this.orderProducts,
    this.user,
    this.grandTotal,
    this.subTotal,
    this.discountTotal,
    this.shippingCharges,
  });

  factory OrderDetailData.fromJson(Map<String, dynamic> json) =>
      OrderDetailData(
        id: json['id'] as num? ?? 0,
        grandTotal: json['grandTotal'] as num? ?? 0,
        subTotal: json['subTotal'] as num? ?? 0,
        discountTotal: json['discountTotal'] as num? ?? 0,
        code: json['code'] as String? ?? '',
        shippingCharges: json['shippingCharges'] as String? ?? '',
        status: json['status'] as String? ?? '',
        createdAt: json['createdAt'] as String? ?? '',
        orderAddress: json['orderAddress'] != null
            ? List<OrderAddress>.from(
                (json['orderAddress'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>(
                  (dynamic x) =>
                      OrderAddress.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        orderProducts: json['orderProducts'] != null
            ? List<OrderProduct>.from(
                (json['orderProducts'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>(
                  (dynamic x) =>
                      OrderProduct.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final num? id;
  final num? grandTotal;
  final num? subTotal;
  final num? discountTotal;
  final String? code;
  final String? status;
  final dynamic shippingCharges;
  final String? createdAt;
  final List<OrderAddress>? orderAddress;
  final List<OrderProduct>? orderProducts;
  final VerifyOtpResponse? user;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id == null ? null : id,
        'code': code == null ? null : code,
        'status': status == null ? null : status,
        'createdAt': createdAt,
        'orderAddress': orderAddress,
        'orderProducts': orderProducts,
        'user': user,
      };
}
