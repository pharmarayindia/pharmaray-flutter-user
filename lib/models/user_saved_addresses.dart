import 'dart:convert';

UserSavedAddresses userSavedAddressesFromJson(String str) =>
    UserSavedAddresses.fromJson(json.decode(str) as Map<String, dynamic>);

String userSavedAddressesToJson(UserSavedAddresses data) =>
    json.encode(data.toJson());

class UserSavedAddresses {
  UserSavedAddresses({
    this.message,
    this.statusCode,
    this.data,
    this.meta,
  });

  factory UserSavedAddresses.fromJson(Map<String, dynamic> json) =>
      UserSavedAddresses(
        message: json['message'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        data: json['data'] != null
            ? List<UserSavedAddressData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      UserSavedAddressData.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
        meta: json['meta'] == null
            ? null
            : UserSavedAddressMeta.fromJson(
                json['meta'] as Map<String, dynamic>),
      );

  final String? message;
  final int? statusCode;
  final List<UserSavedAddressData>? data;
  final UserSavedAddressMeta? meta;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'statusCode': statusCode == null ? null : statusCode,
        'data': data,
        'meta': meta,
      };
}

class UserSavedAddressData {
  UserSavedAddressData({
    this.id,
    this.userId,
    this.fullName,
    this.line1,
    this.line2,
    this.landmark,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.area,
    this.contactNumber,
    this.isDeleted,
    this.type,
    this.isDefault,
  });

  factory UserSavedAddressData.fromJson(Map<String, dynamic> json) =>
      UserSavedAddressData(
        id: json['id'] as int? ?? 0,
        userId: json['userId'] as int? ?? 0,
        fullName: json['fullName'] as String? ?? '',
        line1: json['line1'] as String? ?? '',
        line2: json['line2'] as String? ?? '',
        landmark: json['landmark'] as String? ?? '',
        city: json['city'] as String? ?? '',
        state: json['state'] as String? ?? '',
        country: json['country'] as String? ?? '',
        pincode: json['pincode'] as String? ?? '',
        contactNumber: json['contactNumber'] as String? ?? '',
        isDeleted: json['isDeleted'] as bool? ?? false,
        isDefault: json['isDefault'] as bool? ?? false,
        type: json['type'] as String? ?? '',
        area: json['area'] as String? ?? '',
      );

  final int? id;
  final int? userId;
  final String? fullName;
  final String? line1;
  final String? area;
  final String? line2;
  final String? landmark;
  final String? city;
  final String? state;
  final String? country;
  final String? pincode;
  final String? contactNumber;
  final bool? isDeleted;
  final bool? isDefault;
  final String? type;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id == null ? null : id,
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
        'isDeleted': isDeleted == null ? null : isDeleted,
      };
}

class UserSavedAddressMeta {
  UserSavedAddressMeta({
    this.page,
    this.take,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  factory UserSavedAddressMeta.fromJson(Map<String, dynamic> json) =>
      UserSavedAddressMeta(
        page: json['page'],
        take: json['take'],
        itemCount: json['itemCount'],
        pageCount: json['pageCount'],
        hasPreviousPage: json['hasPreviousPage'] as bool? ?? false,
        hasNextPage: json['hasNextPage'] as bool? ?? false,
      );

  dynamic page;
  dynamic take;
  dynamic itemCount;
  final dynamic pageCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page == null ? null : page,
        'take': take == null ? null : take,
        'itemCount': itemCount == null ? null : itemCount,
        'pageCount': pageCount,
        'hasPreviousPage': hasPreviousPage == null ? null : hasPreviousPage,
        'hasNextPage': hasNextPage == null ? null : hasNextPage,
      };
}
