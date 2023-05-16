import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmaray/lib.dart';

class ApiClient {
  ApiWrapper apiWrapper = ApiWrapper();
  late Dio dio;

  Future<ResponseModel> login(
      {required String mobileNumber, required bool isLoading}) async {
    var data = {'mobile': '$mobileNumber'};
    var response = await apiWrapper.makeRequest('api/v1/auth/login',
        Request.post, data, isLoading, {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> addAddress(
      {required String fullName,
      required String contactNumber,
      required String line1,
      required String line2,
      required String landmark,
      required String city,
      required String state,
      required String country,
      required String pinCode,
      required String type,
      required String area,
      required bool isDefault,
      required bool isLoading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var userId = GetStorage('appData').read<String>(AppConstants.userId);
    var data = {
      'userId': userId,
      'fullName': fullName,
      'contactNumber': contactNumber,
      'isDefault': isDefault,
      'line1': line1,
      'line2': line2,
      'landmark': landmark,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pinCode,
      'type': type,
      'area': area
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/user-addresses',
        Request.post,
        data,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> verifyOTP(
      {required String mobileNumber,
      required String otp,
      required bool isLoading}) async {
    var data = {'mobile': '$mobileNumber', 'otp': '$otp'};
    var response = await apiWrapper.makeRequest('api/v1/auth/login/verify-otp',
        Request.post, data, isLoading, {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> updateCartItems(
      {required num productId,
      required num quantity,
      required bool isLoading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = {'productId': productId, 'quantity': quantity};
    var response = await apiWrapper.makeRequest(
        'api/v1/cart-items',
        Request.post,
        data,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> addToRecentlyViewed(
      {required num productId, required bool isLoading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = {'productId': productId};
    var response = await apiWrapper.makeRequest(
        'api/v1/recently-viewed-items',
        Request.post,
        data,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> searchMedicine(
      {required String searchText,
      required bool isLoading,
      required num? widgetId}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{};
    if (widgetId == null || widgetId == -1) {
      data = <String, dynamic>{'suggest': '$searchText'};
    } else {
      data = <String, dynamic>{'widget': widgetId};
    }
    var response = await apiWrapper.makeRequest(
        'api/v1/catalog/suggest',
        Request.post,
        data,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> storeMedicines(
      {required String searchText,
      required bool isLoading,
      required int skip,
      required int limit}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{
      'skip': skip,
      'limit': limit,
      'search': '$searchText'
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/catalog/search',
        Request.post,
        data,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> updateUser(
      {required String? email,
      required String fullName,
      required String? dob,
      required String city,
      required String area,
      required bool isLoading}) async {
    var userId = GetStorage('appData').read<String>(AppConstants.userId);
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{
      'email': '$email',
      'fullName': '$fullName',
      'latLon': '22.9987655.8899',
      'dob': dob == null ? '' : '$dob',
      'city': '$city',
      'area': '$area'
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/users/$userId',
        Request.put,
        data,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getCities({required bool isLoading}) async {
    var response = await apiWrapper.makeRequest('api/v1/allowed-cities',
        Request.get, null, isLoading, {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> getReminders({required bool isLoading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/reminder',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getOrderListing(
      {required bool isLoading, required num page, required num take}) async {
    // var userId = GetStorage('appData').read<String>(AppConstants.userId);
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        // 'api/v1/orders/find-by-user/?id=$userId&page=$page&take=$take',
        'api/v1/orders/find-by-user?page=$page&take=$take',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getOrderDetails(
      {required bool isLoading, required String orderId}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/orders/$orderId/details',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getProfile({required bool isLoading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/auth/session',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> deleteAddress(
      {required bool isLoading, required String addressId}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/user-addresses/$addressId',
        Request.delete,
        null,
        isLoading,
        {'Authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getAddresses({required bool isLoading}) async {
    var userId = GetStorage('appData').read<String>(AppConstants.userId);
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/user-addresses/find-by-user/?order=ASC&page=1&take=50&userId=$userId',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getHomeData(
      {required bool isLoading, required String pageType}) async {
    var response = await apiWrapper.makeRequest(
        'api/v1/content-management/find-by-page/$pageType',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> getAreas(
      {required bool isLoading, required String cityId}) async {
    var response = await apiWrapper.makeRequest(
        'api/v1/allowed-area/find-by-city/$cityId',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> getSearchMedicineListData(
      {required bool isLoading}) async {
    var response = await apiWrapper.makeRequest(
        'api/v1/content-management/find-by-page/search',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> getCartItems({required bool isLoading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/cart-items',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getRecentlyViewedItems(
      {required bool isLoading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/recently-viewed-items',
        Request.get,
        null,
        isLoading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getCartTotals(
      {required dynamic cartItems,
      required bool loading,
      required String? couponCode}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{};
    if (couponCode == null || couponCode.isEmpty) {
      data = <String, dynamic>{'cartItems': cartItems};
    } else {
      data = <String, dynamic>{
        'cartItems': cartItems,
        'couponCode': couponCode
      };
    }
    var response = await apiWrapper.makeRequest(
        'api/v1/orders/get-totals',
        Request.post,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getInvoice({
    required dynamic orderId,
    required bool loading,
  }) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    // var data = <String, dynamic>{'id': orderId};
    var response = await apiWrapper.makeRequest(
        'api/v1/orders/entire-data/pdf/$orderId',
        Request.post,
        // data,
        null,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> reOrder({
    required dynamic orderId,
    required bool loading,
  }) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var response = await apiWrapper.makeRequest(
        'api/v1/orders/re-order/$orderId',
        Request.post,
        <String, dynamic>{},
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> deleteReminder({
    required num? reminderId,
    required bool loading,
  }) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = {'reminderId': reminderId};
    var response = await apiWrapper.makeRequest(
        'api/v1/reminder',
        Request.patch,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> updateFcm({
    required String? fcmToken,
    required bool loading,
  }) async {
    var userId = GetStorage('appData').read<String>(AppConstants.userId);
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{
      'userId': userId,
      'FCMToken': fcmToken,
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/auth/user/mobile/token',
        Request.patch,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> getProductDetails(
      {required String productId, required bool loading}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{};
    data = <String, dynamic>{
      'terms': [
        {'field': 'productId', 'value': '$productId'}
      ],
      'skip': 0,
      'limit': 1
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/catalog/search',
        Request.post,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> createOrder({
    required dynamic cartItems,
    required bool loading,
    required int userAddressId,
    required String? couponCode,
    required String? orderPlacedType,
  }) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var userId = GetStorage('appData').read<String>(AppConstants.userId);
    var data = <String, dynamic>{};
    if (couponCode == null || couponCode.isEmpty) {
      data = <String, dynamic>{
        'userId': int.parse(userId.toString()),
        'userAddressId': userAddressId,
        'cartItems': cartItems,
        'orderPlacedType': orderPlacedType
      };
    } else {
      data = <String, dynamic>{
        'userId': int.parse(userId.toString()),
        'userAddressId': userAddressId,
        'cartItems': cartItems,
        'couponCode': couponCode,
        'orderPlacedType': orderPlacedType
      };
    }
    var response = await apiWrapper.makeRequest(
        'api/v1/orders',
        Request.post,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> transactions(
      {required bool loading,
      required int orderId,
      required num amount,
      required int paymentMode,
      required dynamic paymentResponse}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{
      'orderId': orderId,
      'amount': amount,
      'paymentMode': paymentMode == 0 ? 'PAYMENT_GATEWAY' : 'CASH_ON_DELIVERY',
      'paymentResponse': paymentResponse
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/transactions',
        Request.post,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> addReminder({
    required bool loading,
    required String reminderName,
    required String startDate,
    required String endDate,
    required bool beforeMeal,
    required num numberOfTablets,
    required String reminderTime,
    required String reminderLabel,
  }) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{
      'reminderName': reminderName,
      'startDoseDate': startDate,
      'endDoseDate': endDate,
      'beforeMeal': beforeMeal,
      'noOfTablets': numberOfTablets,
      'reminderTime': reminderTime,
      'reminderLabel': reminderLabel
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/reminder',
        Request.post,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<ResponseModel> completeOrder(
      {required bool loading,
      required int orderId,
      required num amount,
      required int paymentMode,
      required dynamic paymentResponse}) async {
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var data = <String, dynamic>{
      'orderId': orderId,
      'paidAmount': amount,
      // 'paymentGateway':
      //     paymentMode == 0 ? 'PAYMENT_GATEWAY' : 'CASH_ON_DELIVERY',
      'paymentGateway': 'CASH_ON_DELIVERY',
      // 'paymentResponse': paymentMode == 0 ? paymentResponse : 'RECEIVED'
      'paymentResponse': 'RECEIVED'
    };
    var response = await apiWrapper.makeRequest(
        'api/v1/orders/complete-order',
        Request.post,
        data,
        loading,
        {'Content-Type': 'application/json', 'authorization': '$token'});
    return response;
  }

  Future<dynamic> uploadImage(File file, bool isCall) async {
    dio = Dio();
    var token = GetStorage('appData').read<String>(AppConstants.token);
    var fileName = file.path.split('/').last;
    Utility.showLoadingDialog();
    var formData = FormData.fromMap(<String, dynamic>{
      'file': await MultipartFile.fromFile(file.path, filename: fileName),
      'callFromPharmacy': isCall
    });
    dynamic response = await dio.post<dynamic>(
        'http://194.163.176.83:9000/api/v1/user-prescriptions/upload',
        data: formData,
        options: Options(
          headers: <String, dynamic>{'authorization': '$token'},
        ));
    Utility.closeDialog();
    return response;
  }
}
