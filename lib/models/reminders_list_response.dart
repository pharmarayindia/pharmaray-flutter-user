// To parse this JSON data, do
//
//     final remindersListResponse = remindersListResponseFromJson(jsonString);

import 'dart:convert';

RemindersListResponse remindersListResponseFromJson(String str) =>
    RemindersListResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String remindersListResponseToJson(RemindersListResponse data) =>
    json.encode(data.toJson());

class RemindersListResponse {
  RemindersListResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory RemindersListResponse.fromJson(Map<String, dynamic> json) =>
      RemindersListResponse(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as num? ?? 0,
        data: json['data'] != null
            ? List<ReminderData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      ReminderData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  final String? message;
  final num? statusCode;
  final List<ReminderData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'statusCode': statusCode,
        'data': data,
      };
}

class ReminderData {
  ReminderData({
    this.id,
    this.reminderName,
    this.userId,
    this.startDoseDate,
    this.endDoseDate,
    this.beforeMeal,
    this.noOfTablets,
    this.reminderTime,
    this.reminderLabel,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory ReminderData.fromJson(Map<String, dynamic> json) => ReminderData(
        id: json['id'] as num? ?? 0,
        reminderName: json['reminderName'] as String? ?? '',
        userId: json['userId'] as num? ?? 0,
        startDoseDate: json['startDoseDate'] as String? ?? '',
        endDoseDate: json['endDoseDate'] as String? ?? '',
        beforeMeal: json['beforeMeal'] as bool? ?? false,
        noOfTablets: json['noOfTablets'] as num? ?? 0,
        reminderTime: json['reminderTime'] as String? ?? '',
        reminderLabel: json['reminderLabel'] as String? ?? '',
        isDeleted: json['isDeleted'] as bool? ?? false,
        createdAt: json['createdAt'] as String? ?? '',
        updatedAt: json['updatedAt'] as String? ?? '',
      );

  final num? id;
  final String? reminderName;
  final num? userId;
  final String? startDoseDate;
  final String? endDoseDate;
  final bool? beforeMeal;
  final num? noOfTablets;
  final String? reminderTime;
  final String? reminderLabel;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  Map<String, dynamic> toJson() => <String,dynamic>{
        'id': id,
        'reminderName': reminderName,
        'userId': userId,
        'startDoseDate': startDoseDate,
        'endDoseDate': endDoseDate,
        'beforeMeal': beforeMeal,
        'noOfTablets': noOfTablets,
        'reminderTime': reminderTime,
        'reminderLabel': reminderLabel,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
