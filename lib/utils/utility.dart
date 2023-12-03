import 'dart:convert';
import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:pharmaray/lib.dart';

// coverage:ignore-file
abstract class Utility {
  // coverage:ignore-start
  static void printDLog(String message) {
    Logger().d('${StringConstants.appName}: $message');
  }

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    Logger().i('${StringConstants.appName}: $message');
  }

  static List<bool> passwordValidator(String password) {
    var validationStatus = <bool>[false, false, false, false];
    validationStatus[0] = password.length >= 8;
    validationStatus[1] = RegExp(r'(?=.*[A-Z])').hasMatch(password);
    validationStatus[2] = RegExp(r'(?=.*?[0-9])').hasMatch(password);
    validationStatus[3] =
        RegExp(r'(?=.*[_+,/:;<>`{}|"%!-@#$&*~])').hasMatch(password);
    return validationStatus;
  }

  /// Show alert dialog
  static void showAlertDialog({
    required String message,
    required String title,
    required Function() onPress,
  }) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: const Text('Yes'),
          ),
          const CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: closeDialog,
            child: Text('No'),
          )
        ],
      ),
    );
  }

  static void showDialog(
    String message, {
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoButton(
            onPressed: onPress ?? Get.back,
            child: Text(
              'Okay',
              style: TextStyle(color: Theme.of(Get.context!).primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  /// Show error dialog from response model
  static void showInfoDialog(ResponseModel data,
      {bool isSuccess = false}) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text(isSuccess ? 'SUCCESS' : 'ERROR'),
        content: Text(
          jsonDecode(data.data)['message'].toString(),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: const Text(
              'Okay',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  /// Show error dialog from response model
  static void showSuccessDialog(ResponseModel data,
      [bool isSuccess = false]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: const Text('SUCCESS'),
        content: Text(
          jsonDecode(data.data)['message'] as String? ?? 'Invalid Data',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: const Text(
              'Okay',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  /// Show error dialog from response model
  static void showErrorDialog(String message, [bool isSuccess = false]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: const Text('ERROR'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: const Text(
              'Okay',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  static String? validatePassword(String value) {
    if (value.trim().isNotEmpty) {
      if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        if (value.contains(RegExp(r'[A-Z]'))) {
          if (value.contains(RegExp(r'[0-9]'))) {
            if (value.length < 6) {
              return StringConstants.shouldBe6Characters;
            } else {
              return null;
            }
          } else {
            return StringConstants.shouldHaveOneDigit;
          }
        } else {
          return StringConstants.shouldHaveOneUppercaseLetter;
        }
      } else {
        return StringConstants.shouldHaveOneSpecialCharacter;
      }
    } else {
      return StringConstants.passwordRequired;
    }
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('${StringConstants.appName}: $message');
  }

  static bool emailValidator(String email) => EmailValidator.validate(email);

  /// Show loader
  static void showLoadingDialog() async {
    await Get.dialog<dynamic>(
      Center(
        child: LoadingAnimationWidget.waveDots(
          color: AppColors.primaryColor,
          size: 60,
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.3),
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printLog(dynamic message) {
    Logger().log(Level.info, message);
  }

  static final Random _random = Random();

  static String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  static int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  static String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');

  static String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final special = 8 + _random.nextInt(4);
    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }
}
Widget getImage(BuildContext context, String imageUrl) => Image.asset(imageUrl);