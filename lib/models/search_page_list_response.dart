// To parse this JSON data, do
//
//     final searchPageListResponse = searchPageListResponseFromJson(jsonString);

import 'dart:convert';

SearchPageListResponse searchPageListResponseFromJson(String str) =>
    SearchPageListResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String searchPageListResponseToJson(SearchPageListResponse data) =>
    json.encode(data.toJson());

class SearchPageListResponse {
  SearchPageListResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory SearchPageListResponse.fromJson(Map<String, dynamic> json) =>
      SearchPageListResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as num? ?? 0,
        data: json['data'] != null
            ? List<SearchPageListData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      SearchPageListData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final String? message;
  final num? statusCode;
  final List<SearchPageListData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
      };
}

class SearchPageListData {
  SearchPageListData({
    this.widgets,
    this.name,
    this.page,
    this.type,
  });

  factory SearchPageListData.fromJson(Map<String, dynamic> json) =>
      SearchPageListData(
        widgets: json['widgets'] != null
            ? List<SearchPageListItem>.from(
                (json['widgets'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      SearchPageListItem.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        name: json['name'] as String? ?? '',
        page: json['page'] as String? ?? '',
        type: json['type'] as String? ?? '',
      );

  final List<SearchPageListItem>? widgets;
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

class SearchPageListItem {
  SearchPageListItem({
    this.id,
    this.mediaUrl,
    this.priority,
    this.name,
  });

  factory SearchPageListItem.fromJson(Map<String, dynamic> json) =>
      SearchPageListItem(
        id: json['id'] as num? ?? 0,
        mediaUrl: json['mediaUrl'],
        priority: json['priority'] as num? ?? 0,
        name: json['name'] as String? ?? '',
      );

  final num? id;
  final dynamic mediaUrl;
  final num? priority;
  final String? name;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id == null ? null : id,
        'mediaUrl': mediaUrl,
        'priority': priority == null ? null : priority,
        'name': name == null ? null : name,
      };
}
