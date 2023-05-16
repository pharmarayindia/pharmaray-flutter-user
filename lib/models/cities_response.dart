import 'dart:convert';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

class CitiesResponse {
  CitiesResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
        message: json['message'],
        statusCode: json['statusCode'] as int? ?? 0,
        data: json['data'] != null
            ? List<CitiesData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) => CitiesData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final dynamic message;
  final int? statusCode;
  final List<CitiesData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'statusCode': statusCode,
        'data': data,
      };
}

class CitiesData {
  CitiesData({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.isDeleted,
  });

  factory CitiesData.fromJson(Map<String, dynamic> json) => CitiesData(
        createdAt: json['createdAt'] as String? ?? '',
        updatedAt: json['updatedAt'] as String? ?? '',
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        isDeleted: json['isDeleted'] as bool? ?? false,
      );

  final String? createdAt;
  final String? updatedAt;
  final int? id;
  final String? name;
  final bool? isDeleted;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'id': id,
        'name': name,
        'isDeleted': isDeleted,
      };
}
