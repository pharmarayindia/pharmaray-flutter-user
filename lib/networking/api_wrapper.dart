// coverage:ignore-file

import 'dart:async';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pharmaray/lib.dart';

/// API WRAPPER to call all the APIs and handle the error status codes
class ApiWrapper {
  final String _baseUrl = 'http://194.163.176.83:9000/';

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeRequest(String url, Request request, dynamic data,
      bool isLoading, Map<String, String> headers) async {
    /// To see whether the network is available or not
    if (await Utility.isNetworkAvailable()) {
      switch (request) {

        /// Method to make the Get type request
        case Request.get:
          {
            var uri = _baseUrl + url;

            if (isLoading) Utility.showLoadingDialog();

            try {
              final response = await http
                  .get(
                    Uri.parse(uri),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.post:

          /// Method to make the Post type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoadingDialog();
              final response = await http
                  .post(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.put:

          /// Method to make the Put type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoadingDialog();
              final response = await http
                  .put(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }

        case Request.patch:

          /// Method to make the Patch type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoadingDialog();
              final response = await http
                  .patch(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}',
                  hasError: true,
                  errorCode: 1000);
            }
          }
        case Request.delete:

          /// Method to make the Delete type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoadingDialog();

              final response = await http
                  .delete(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              Utility.closeDialog();

              Utility.printILog(uri);
              Utility.printLog(response.body);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
      }
    }

    /// If there is no network available then instead of print can show the no internet widget too
    else {
      return ResponseModel(
        data:
            '{"message":"No internet, please enable mobile data or wi-fi in your phone settings and try again"}',
        hasError: true,
        errorCode: 1000,
      );
    }
  }

  /// Method to return the API response based upon the status code of the server
  ResponseModel returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ResponseModel(
            data: response.body,
            hasError: false,
            errorCode: response.statusCode);
      case 401:
        GetStorage('appData').erase();
        RouteManagement.goToLogin();
        return ResponseModel(
          data: response.body,
          hasError: true,
          errorCode: response.statusCode,
        );
      case 406:
        return ResponseModel(
          data: response.body,
          hasError: true,
          errorCode: response.statusCode,
        );
      case 409:
      case 500:
      case 522:
        return ResponseModel(
            data: response.body,
            hasError: true,
            errorCode: response.statusCode);
      default:
        return ResponseModel(
            data: response.body,
            hasError: true,
            errorCode: response.statusCode);
    }
  }
}
