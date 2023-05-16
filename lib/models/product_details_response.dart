// To parse this JSON data, do
//
//     final productDetailsResponse = productDetailsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:pharmaray/lib.dart';

ProductDetailsResponse productDetailsResponseFromJson(String str) =>
    ProductDetailsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String productDetailsResponseToJson(ProductDetailsResponse data) =>
    json.encode(data.toJson());

class ProductDetailsResponse {
  ProductDetailsResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailsResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as num? ?? 0,
        data: json['data'] != null
            ? List<ProductDetailData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      ProductDetailData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final String? message;
  final num? statusCode;
  final List<ProductDetailData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}

class ProductDetailData {
  ProductDetailData({
    this.productId,
    this.productName,
    this.productOtherName,
    this.skuCode,
    this.parentSkuCode,
    this.urlSlug,
    this.longDescription,
    this.shortDescription,
    this.listedPrice,
    this.discountedPrice,
    this.igstNumber,
    this.hsnNumber,
    this.availableQuantity,
    this.status,
    // this.tags,
    this.usage,
    this.brand,
    this.packingType,
    this.packageType,
    this.others,
    this.characteristics,
    // this.images,
    this.suggest,
    this.itemSuggest,
    this.cartQuantity,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      ProductDetailData(
        productId: json['productId'] as String? ?? '',
        productName: json['productName'] as String? ?? '',
        productOtherName: json['productOtherName'] as String? ?? '',
        skuCode: json['skuCode'] as String? ?? '',
        parentSkuCode: json['parentSkuCode'] as String? ?? '',
        urlSlug: json['urlSlug'] as String? ?? '',
        longDescription: json['longDescription'],
        shortDescription: json['shortDescription'],
        listedPrice: json['listedPrice'] as num? ?? 0,
        discountedPrice: json['discountedPrice'] as num? ?? 0,
        igstNumber: json['igstNumber'] as String? ?? '',
        hsnNumber: json['hsnNumber'] as String? ?? '',
        availableQuantity: json['availableQuantity'] as num? ?? 0,
        status: json['status'],
        // tags: json['tags'] == null
        //     ? null
        //     : List<String>.from(json['tags'].map((x) => x)),
        usage: json['usage'],
        brand: json['brand'] as String? ?? '',
        packingType: json['packingType'] as String? ?? '',
        packageType: json['packageType'] as String? ?? '',
        others: json['others'],
        characteristics: json['characteristics'] != null
            ? List<Characteristic>.from(
                (json['characteristics'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>(
                  (dynamic x) =>
                      Characteristic.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        // images: json['images'] == null
        //     ? null
        //     : List<dynamic>.from(json['images'].map((x) => x)),
        suggest: json['suggest'] != null
            ? List<Suggest>.from(
                (json['suggest'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) => Suggest.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        itemSuggest: json['itemSuggest'] != null
            ? List<Suggest>.from(
                (json['itemSuggest'] as List<dynamic>? ?? <dynamic>[])
                    .map<dynamic>(
                  (dynamic x) => Suggest.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        cartQuantity: json['cartQuantity'] as num? ?? 0,
      );

  final String? productId;
  final String? productName;
  final String? productOtherName;
  final String? skuCode;
  final String? parentSkuCode;
  final String? urlSlug;
  final dynamic longDescription;
  final dynamic shortDescription;
  final num? listedPrice;
  final num? discountedPrice;
  final String? igstNumber;
  final String? hsnNumber;
  final num? availableQuantity;
  final dynamic status;

  // final List<String>? tags;
  final dynamic usage;
  final String? brand;
  final String? packingType;
  final String? packageType;
  final dynamic others;
  final List<Characteristic>? characteristics;

  // final List<dynamic> images;
  final List<Suggest>? suggest;
  final List<Suggest>? itemSuggest;
  final num? cartQuantity;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'productId': productId == null ? null : productId,
        'productName': productName == null ? null : productName,
        'productOtherName': productOtherName == null ? null : productOtherName,
        'skuCode': skuCode == null ? null : skuCode,
        'parentSkuCode': parentSkuCode == null ? null : parentSkuCode,
        'urlSlug': urlSlug == null ? null : urlSlug,
        'longDescription': longDescription,
        'shortDescription': shortDescription,
        'listedPrice': listedPrice == null ? null : listedPrice,
        'discountedPrice': discountedPrice == null ? null : discountedPrice,
        'igstNumber': igstNumber == null ? null : igstNumber,
        'hsnNumber': hsnNumber == null ? null : hsnNumber,
        'availableQuantity':
            availableQuantity == null ? null : availableQuantity,
        'status': status == null ? null : status,
        // 'tags': tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        'usage': usage,
        'brand': brand == null ? null : brand,
        'packingType': packingType == null ? null : packingType,
        'packageType': packageType == null ? null : packageType,
        'others': others,
        'characteristics': characteristics,
        // 'images':
        //     images == null ? null : List<dynamic>.from(images.map((x) => x)),
        'suggest': suggest,
        'itemSuggest': itemSuggest,
        'cartQuantity': cartQuantity == null ? null : cartQuantity,
      };
}
