// To parse this JSON data, do
//
//     final searchMedicineResponse = searchMedicineResponseFromJson(jsonString);

import 'dart:convert';

SearchMedicineResponse searchMedicineResponseFromJson(String str) =>
    SearchMedicineResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String searchMedicineResponseToJson(SearchMedicineResponse data) =>
    json.encode(data.toJson());

class SearchMedicineResponse {
  SearchMedicineResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory SearchMedicineResponse.fromJson(Map<String, dynamic> json) =>
      SearchMedicineResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        data: json['data'] != null
            ? List<MedicinesData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      MedicinesData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final String? message;
  final int? statusCode;
  final List<MedicinesData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'statusCode': statusCode,
        'data': data,
      };
}

class MedicinesData {
  MedicinesData({
    this.id,
    this.source,
    this.score,
  });

  factory MedicinesData.fromJson(Map<String, dynamic> json) => MedicinesData(
        id: json['_id'] as String? ?? '',
        source: Source.fromJson(
            json['source'] as Map<String, dynamic>? ?? <String, dynamic>{}),
        score: json['score'] as int? ?? 0,
      );

  final String? id;
  final Source? source;
  final int? score;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'source': source,
        'score': score,
      };
}

class Source {
  Source({
    this.text,
    this.productId,
    this.productName,
    this.productOtherName,
    this.skuCode,
    this.parentSkuCode,
    this.urlSlug,
    this.cartQuantity,
    this.longDescription,
    this.shortDescription,
    this.listedPrice,
    this.discountedPrice,
    this.igstNumber,
    this.hsnNumber,
    this.availableQuantity,
    this.status,
    this.tags,
    this.usage,
    this.brand,
    this.packingType,
    this.packageType,
    this.others,
    this.characteristics,
    // this.images,
    this.suggest,
    this.quantity
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        text: json['text'] as String? ?? '',
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
        cartQuantity: json['cartQuantity'] as num? ?? 0,
        status: json['status'] as num? ?? 0,
        quantity: json['quantity'] as num? ?? 0,
        tags: json['tags'] != null
            ? List<String>.from((json['tags'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x))
            : [],
        usage: json['usage'] == null
            ? []
            : List<String>.from((json['usage'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>((dynamic x) => x)),
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
        // images: List<dynamic>.from(json['images'].map((x) => x)),
        suggest: json['suggest'] != null
            ? List<Suggest>.from(
                (json['suggest'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) => Suggest.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final String? text;
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
  final num? status;
  num? cartQuantity;
  num? quantity;
  final List<String>? tags;
  final List<String>? usage;
  final String? brand;
  final String? packingType;
  final String? packageType;
  final dynamic others;
  final List<Characteristic>? characteristics;

  // final List<dynamic>? images;
  final List<Suggest>? suggest;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'productId': productId,
        'productName': productName,
        'productOtherName': productOtherName,
        'skuCode': skuCode,
        'parentSkuCode': parentSkuCode,
        'urlSlug': urlSlug,
        'longDescription': longDescription,
        'shortDescription': shortDescription,
        'listedPrice': listedPrice,
        'discountedPrice': discountedPrice,
        'igstNumber': igstNumber,
        'hsnNumber': hsnNumber,
        'availableQuantity': availableQuantity,
        'status': status,
        'tags': tags,
        'usage': usage,
        'brand': brand,
        'packingType': packingType,
        'packageType': packageType,
        'others': others,
        'characteristics': characteristics,
        // 'images': images,
        'suggest': suggest,
      };
}

class Characteristic {
  Characteristic({
    this.name,
    this.label,
    this.value,
  });

  factory Characteristic.fromJson(Map<String, dynamic> json) => Characteristic(
        name: json['name'] as String? ?? '',
        label: json['label'] as String? ?? '',
        value: json['value'] as String? ?? '',
      );

  final String? name;
  final String? label;
  final String? value;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'label': label,
        'value': value,
      };
}

class Suggest {
  Suggest({
    this.input,
    this.weight,
  });

  factory Suggest.fromJson(Map<String, dynamic> json) => Suggest(
        input: json['input'] as String? ?? '',
        weight: json['weight'] as int? ?? 0,
      );

  final String? input;
  final int? weight;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'input': input,
        'weight': weight,
      };
}
