// To parse this JSON data, do
//
//     final createOrderResponse = createOrderResponseFromJson(jsonString);

import 'dart:convert';

CreateOrderResponse createOrderResponseFromJson(String str) =>
    CreateOrderResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String createOrderResponseToJson(CreateOrderResponse data) =>
    json.encode(data.toJson());

class CreateOrderResponse {
  CreateOrderResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      CreateOrderResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as num? ?? 0,
        data: json['data'] == null
            ? null
            : CreateOrderData.fromJson(json['data'] as Map<String, dynamic>),
      );

  final String? message;
  final num? statusCode;
  final CreateOrderData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}

class CreateOrderData {
  CreateOrderData({
    this.order,
    this.orderProducts,
    this.orderAddress,
  });

  factory CreateOrderData.fromJson(Map<String, dynamic> json) =>
      CreateOrderData(
        order: json['order'] == null
            ? null
            : Order.fromJson(json['order'] as Map<String, dynamic>),
        orderProducts: json['orderProducts'] != null
            ? List<OrderProduct>.from(
                (json['orderProducts'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>(
                  (dynamic x) =>
                      OrderProduct.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        orderAddress: json['orderAddress'] == null
            ? null
            : OrderAddress.fromJson(
                json['orderAddress'] as Map<String, dynamic>),
      );

  final Order? order;
  final List<OrderProduct>? orderProducts;
  final OrderAddress? orderAddress;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'order': order,
        'orderProducts': orderProducts,
        'orderAddress': orderAddress,
      };
}

class Order {
  Order({
    this.code,
    this.discountTotal,
    this.grandTotal,
    this.subTotal,
    this.userId,
    this.status,
    this.couponId,
    this.transactionId,
    this.id,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        code: json['code'] as String? ?? '',
        discountTotal: json['discountTotal'] as num? ?? 0,
        grandTotal: json['grandTotal'] as num? ?? 0,
        subTotal: json['subTotal'] as num? ?? 0,
        userId: json['userId'] as num? ?? 0,
        status: json['status'] as String? ?? '',
        couponId: json['couponId'],
        transactionId: json['transactionId'],
        id: json['id'] as num? ?? 0,
      );

  final String? code;
  final num? discountTotal;
  final num? grandTotal;
  final num? subTotal;
  final num? userId;
  final String? status;
  final dynamic couponId;
  final dynamic transactionId;
  final num? id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code == null ? null : code,
        'discountTotal': discountTotal == null ? null : discountTotal,
        'grandTotal': grandTotal == null ? null : grandTotal,
        'subTotal': subTotal == null ? null : subTotal,
        'userId': userId == null ? null : userId,
        'status': status == null ? null : status,
        'couponId': couponId,
        'transactionId': transactionId,
        'id': id == null ? null : id,
      };
}

class OrderAddress {
  OrderAddress({
    this.userId,
    this.fullName,
    this.line1,
    this.line2,
    this.landmark,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.contactNumber,
    this.isDefault,
    this.type,
    this.orderId,
    this.id,
  });

  factory OrderAddress.fromJson(Map<String, dynamic> json) => OrderAddress(
        userId: json['userId'] as num? ?? 0,
        fullName: json['fullName'] as String? ?? '',
        line1: json['line1'] as String? ?? '',
        line2: json['line2'] as String? ?? '',
        landmark: json['landmark'] as String? ?? '',
        city: json['city'] as String? ?? '',
        state: json['state'] as String? ?? '',
        country: json['country'] as String? ?? '',
        pincode: json['pincode'] as String? ?? '',
        contactNumber: json['contactNumber'] as String? ?? '',
        isDefault: json['isDefault'] as bool? ?? false,
        type: json['type'] as String? ?? '',
        orderId: json['orderId'] as num? ?? 0,
        id: json['id'] as num? ?? 0,
      );

  final num? userId;
  final String? fullName;
  final String? line1;
  final String? line2;
  final String? landmark;
  final String? city;
  final String? state;
  final String? country;
  final String? pincode;
  final String? contactNumber;
  final bool? isDefault;
  final String? type;
  final num? orderId;
  final num? id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId == null ? null : userId,
        'fullName': fullName == null ? null : fullName,
        'line1': line1 == null ? null : line1,
        'line2': line2 == null ? null : line2,
        'landmark': landmark == null ? null : landmark,
        'city': city == null ? null : city,
        'state': state == null ? null : state,
        'country': country == null ? null : country,
        'pincode': pincode == null ? null : pincode,
        'contactNumber': contactNumber == null ? null : contactNumber,
        'isDefault': isDefault == null ? null : isDefault,
        'type': type == null ? null : type,
        'orderId': orderId == null ? null : orderId,
        'id': id == null ? null : id,
      };
}

class OrderProduct {
  OrderProduct({
    this.productName,
    this.medicine_image,
    this.quantity,
    this.discountedPrice,
    this.listedPrice,
    this.orderId,
    this.productId,
    this.status,
    this.id,
    this.discountPercentage,
    this.discountAmount,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        productName: json['productName'] as String? ?? '',
    medicine_image: json['medicine_image'] as String? ?? '',
        quantity: json['quantity'] as num? ?? 0,
        discountedPrice: json['discountedPrice'] as num? ?? 0,
        listedPrice: json['listedPrice'] as num? ?? 0,
        orderId: json['orderId'] as num? ?? 0,
        productId: json['productId'],
        status: json['status'] as String? ?? '',
        id: json['id'] as num? ?? 0,
        discountPercentage: json['discountPercentage'] as num? ?? 0,
        discountAmount: json['discountAmount'] as num? ?? 0,
      );

  final String? productName;
  final String? medicine_image;

  final num? quantity;
  final num? discountedPrice;
  final num? listedPrice;
  final num? orderId;
  final dynamic productId;
  final String? status;
  final num? id;
  final num? discountPercentage;
  final num? discountAmount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'productName': productName == null ? null : productName,
        'medicine_image': medicine_image == null ? null : medicine_image,
        'quantity': quantity == null ? null : quantity,
        'discountedPrice': discountedPrice == null ? null : discountedPrice,
        'listedPrice': listedPrice == null ? null : listedPrice,
        'orderId': orderId == null ? null : orderId,
        'productId': productId == null ? null : productId,
        'status': status == null ? null : status,
        'id': id == null ? null : id,
        'discountPercentage':
            discountPercentage == null ? null : discountPercentage,
        'discountAmount': discountAmount == null ? null : discountAmount,
      };
}
