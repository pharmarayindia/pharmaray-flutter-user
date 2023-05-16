// To parse this JSON data, do
//
//     final homePageResponse = homePageResponseFromJson(jsonString);

import 'dart:convert';

HomePageResponse homePageResponseFromJson(String str) =>
    HomePageResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String homePageResponseToJson(HomePageResponse data) =>
    json.encode(data.toJson());

class HomePageResponse {
  HomePageResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      HomePageResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        data: json['data'] != null
            ? List<HomePageData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      HomePageData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final String? message;
  final int? statusCode;
  final List<HomePageData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}

class HomePageData {
  HomePageData({
    this.widgets,
    this.name,
    this.page,
    this.type,
  });

  factory HomePageData.fromJson(Map<String, dynamic> json) => HomePageData(
        widgets: json['widgets'] != null
            ? List<HomeWidgetData>.from(
                (json['widgets'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      HomeWidgetData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        name: json['name'] as String? ?? '',
        page: json['page'] as String? ?? '',
        type: json['type'] as String? ?? '',
      );

  final List<HomeWidgetData>? widgets;
  final String? name;
  final String? page;
  final String? type;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'widgets': widgets,
        'name': name == null ? null : name,
        'page': page == null ? null : page,
        'type': type == null ? null : type,
      };
}

class HomeWidgetData {
  HomeWidgetData(
      {this.mediaUrl, this.priority, this.name, this.id});

  factory HomeWidgetData.fromJson(Map<String, dynamic> json) => HomeWidgetData(
        mediaUrl: json['mediaUrl'] as String? ?? '',
        priority: json['priority'] as num? ?? 0,
        // isSelected: json['isSelected'] as bool? ?? false,
        id: json['id'] as num? ?? 0,
        name: json['name'],
      );

  final String? mediaUrl;
  final num? priority;
  final num? id;
  // bool? isSelected;
  final dynamic name;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mediaUrl': mediaUrl == null ? null : mediaUrl,
        'priority': priority == null ? null : priority,
        'name': name,
        'id': id
      };
}
