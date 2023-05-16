// To parse this JSON data, do
//
//     final orderListResponse = orderListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:pharmaray/lib.dart';

OrderListResponse orderListResponseFromJson(String str) =>
    OrderListResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String orderListResponseToJson(OrderListResponse data) =>
    json.encode(data.toJson());

class OrderListResponse {
  OrderListResponse({
    this.message,
    this.statusCode,
    this.data,
    this.meta,
  });

  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      OrderListResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as num? ?? 0,
        data: json['data'] != null
            ? List<OrderData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) => OrderData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        meta: json['meta'] == null
            ? null
            : OrderMeta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  final String? message;
  final num? statusCode;
  final List<OrderData>? data;
  final OrderMeta? meta;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
        'meta': meta,
      };
}

class OrderData {
  OrderData({
    this.id,
    this.code,
    this.userId,
    this.grandTotal,
    this.subTotal,
    this.couponId,
    this.discountTotal,
    this.status,
    this.transactionId,
    this.isDeleted,
    this.user,
    this.createdAt,
    this.orderProducts,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      userId: json['userId'] as num? ?? 0,
      grandTotal: json['grandTotal'],
      subTotal: json['subTotal'],
      couponId: json['couponId'],
      discountTotal: json['discountTotal'] as num? ?? 0,
      status: json['status'] as String? ?? '',
      transactionId: json['transactionId'] as num? ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      user: json['user'] == null
          ? null
          : OrderUser.fromJson(json['user'] as Map<String, dynamic>),
      orderProducts: json['orderProducts'] != null
          ? List<OrderProduct>.from(
              (json['orderProducts'] as List<dynamic>? ?? <dynamic>[])
                  .map<dynamic>(
                (dynamic x) => OrderProduct.fromJson(x as Map<String, dynamic>),
              ),
            )
          : []);

  final num? id;
  final String? code;
  final num? userId;
  final dynamic grandTotal;
  final dynamic subTotal;
  final dynamic couponId;
  final num? discountTotal;
  final String? status;
  final num? transactionId;
  final bool? isDeleted;
  final String? createdAt;
  final OrderUser? user;
  final List<OrderProduct>? orderProducts;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id == null ? null : id,
        'code': code == null ? null : code,
        'userId': userId == null ? null : userId,
        'grandTotal': grandTotal,
        'subTotal': subTotal,
        'couponId': couponId,
        'discountTotal': discountTotal == null ? null : discountTotal,
        'status': status,
        'transactionId': transactionId == null ? null : transactionId,
        'isDeleted': isDeleted == null ? null : isDeleted,
        'user': user,
      };
}

class OrderUser {
  OrderUser({
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
    this.latLon,
  });

  factory OrderUser.fromJson(Map<String, dynamic> json) => OrderUser(
        id: json['id'] as num? ?? 0,
        fullName: json['fullName'] as String? ?? '',
        age: json['age'] as num? ?? 0,
        dob: json['dob'],
        mobile: json['mobile'] as String? ?? '',
        email: json['email'],
        password: json['password'],
        status: json['status'] as num? ?? 0,
        role: json['role'] as num? ?? 0,
        isDeleted: json['isDeleted'] as bool? ?? false,
        isProfileCompleted: json['isProfileCompleted'] as bool? ?? false,
        referralCode: json['referralCode'] as String? ?? '',
        referredCode: json['referredCode'],
        city: json['city'] as String? ?? '',
        area: json['area'] as String? ?? '',
        latLon: json['latLon'] as String? ?? '',
      );

  final num? id;
  final String? fullName;
  final num? age;
  final dynamic dob;
  final String? mobile;
  final dynamic email;
  final dynamic password;
  final num? status;
  final num? role;
  final bool? isDeleted;
  final bool? isProfileCompleted;
  final String? referralCode;
  final dynamic referredCode;
  final String? city;
  final String? area;
  final String? latLon;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id == null ? null : id,
        'fullName': fullName,
        'age': age == null ? null : age,
        'dob': dob,
        'mobile': mobile == null ? null : mobile,
        'email': email,
        'password': password,
        'status': status == null ? null : status,
        'role': role == null ? null : role,
        'isDeleted': isDeleted == null ? null : isDeleted,
        'isProfileCompleted':
            isProfileCompleted == null ? null : isProfileCompleted,
        'referralCode': referralCode,
        'referredCode': referredCode,
        'city': city,
        'area': area,
        'latLon': latLon,
      };
}

class OrderMeta {
  OrderMeta({
    this.page,
    this.take,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  factory OrderMeta.fromJson(Map<String, dynamic> json) => OrderMeta(
        page: json['page'] as String? ?? '',
        take: json['take'] as String? ?? '',
        itemCount: json['itemCount'] as num? ?? 0,
        pageCount: json['pageCount'] as num? ?? 0,
        hasPreviousPage: json['hasPreviousPage'] as bool? ?? false,
        hasNextPage: json['hasNextPage'] as bool? ?? false,
      );

  final String? page;
  final String? take;
  final num? itemCount;
  final num? pageCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page == null ? null : page,
        'take': take == null ? null : take,
        'itemCount': itemCount == null ? null : itemCount,
        'pageCount': pageCount == null ? null : pageCount,
        'hasPreviousPage': hasPreviousPage == null ? null : hasPreviousPage,
        'hasNextPage': hasNextPage == null ? null : hasNextPage,
      };
}

// class OrderProduct {
//   OrderProduct({
//     this.id,
//     this.productName,
//     this.quantity,
//     this.discountedPrice,
//     this.listedPrice,
//     this.discountPercentage,
//     this.discountAmount,
//     this.orderId,
//     this.productId,
//     this.status,
//     this.isDeleted,
//   });
//
//   factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
//         id: json['id'] as num? ?? 0,
//         productName: json['productName'] as String? ?? '',
//         quantity: json['quantity'] as num? ?? 0,
//         discountedPrice: json['discountedPrice'] as num? ?? 0,
//         listedPrice: json['listedPrice'] as num? ?? 0,
//         discountPercentage: json['discountPercentage'] as num? ?? 0,
//         discountAmount: json['discountAmount'] as num? ?? 0,
//         orderId: json['orderId'] as num? ?? 0,
//         productId: json['productId'] as num? ?? 0,
//         status: json['status'] as String? ?? '',
//         isDeleted: json['isDeleted'] as bool? ?? false,
//       );
//
//   final num? id;
//   final String? productName;
//   final num? quantity;
//   final num? discountedPrice;
//   final num? listedPrice;
//   final num? discountPercentage;
//   final num? discountAmount;
//   final num? orderId;
//   final num? productId;
//   final String? status;
//   final bool? isDeleted;
//
//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'id': id == null ? null : id,
//         'productName': productName == null ? null : productName,
//         'quantity': quantity == null ? null : quantity,
//         'discountedPrice': discountedPrice == null ? null : discountedPrice,
//         'listedPrice': listedPrice == null ? null : listedPrice,
//         'discountPercentage':
//             discountPercentage == null ? null : discountPercentage,
//         'discountAmount': discountAmount == null ? null : discountAmount,
//         'orderId': orderId == null ? null : orderId,
//         'productId': productId == null ? null : productId,
//         'status': status == null ? null : status,
//         'isDeleted': isDeleted == null ? null : isDeleted,
//       };
// }
