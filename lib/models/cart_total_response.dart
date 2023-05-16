// To parse this JSON data, do
//
//     final cartTotalResponse = cartTotalResponseFromJson(jsonString);

import 'dart:convert';

CartTotalResponse cartTotalResponseFromJson(String str) =>
    CartTotalResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String cartTotalResponseToJson(CartTotalResponse data) =>
    json.encode(data.toJson());

class CartTotalResponse {
  CartTotalResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory CartTotalResponse.fromJson(Map<String, dynamic> json) =>
      CartTotalResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as num? ?? 0,
        data: json['data'] == null
            ? null
            : CartTotalData.fromJson(json['data'] as Map<String, dynamic>),
      );

  final String? message;
  final num? statusCode;
  final CartTotalData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}

class CartTotalData {
  CartTotalData({
    this.subTotal,
    this.grandTotal,
    this.discountTotal,
    this.discountedItems,
    this.couponId,
    this.shippingCharges,
  });

  factory CartTotalData.fromJson(Map<String, dynamic> json) => CartTotalData(
        subTotal: json['subTotal'] as num? ?? 0,
        grandTotal: json['grandTotal'] as num? ?? 0,
        discountTotal: json['discountTotal'] as num? ?? 0,
        discountedItems: json['discountedItems'] != null
            ? List<DiscountedItem>.from(
                (json['discountedItems'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>(
                  (dynamic x) =>
                      DiscountedItem.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        couponId: json['couponId'] as num? ?? 0,
        shippingCharges: json['shippingCharges'] as num? ?? 0,
      );

  final num? subTotal;
  final num? grandTotal;
  final num? discountTotal;

  final List<DiscountedItem>? discountedItems;
  final num? couponId;
  final num? shippingCharges;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subTotal': subTotal == null ? null : subTotal,
        'grandTotal': grandTotal == null ? null : grandTotal,
        'discountTotal': discountTotal == null ? null : discountTotal,
        'discountedItems': discountedItems,
        'couponId': couponId == null ? null : couponId,
        'shippingCharges': shippingCharges == null ? null : shippingCharges,
      };
}

class DiscountedItem {
  DiscountedItem({
    this.productId,
    this.quantity,
    this.discount,
    this.discountedPrice,
  });

  factory DiscountedItem.fromJson(Map<String, dynamic> json) => DiscountedItem(
        productId: json['productId'] as String? ?? '',
        quantity: json['quantity'] as num? ?? 0,
        discount: json['discount'] as num? ?? 0,
        discountedPrice: json['discountedPrice'] as num? ?? 0,
      );

  final String? productId;
  final num? quantity;
  final num? discount;
  final num? discountedPrice;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'productId': productId == null ? null : productId,
        'quantity': quantity == null ? null : quantity,
        'discount': discount == null ? null : discount,
        'discountedPrice': discountedPrice == null ? null : discountedPrice,
      };
}
