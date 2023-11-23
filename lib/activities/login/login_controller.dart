import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pharmaray/lib.dart';

class LoginController extends GetxController {
  String? phoneNoErrorText;
  String? fullNameErrorText;
  String? emailErrorText;
  String? dobErrorText;
  CitiesData? selectedCity;
  CitiesData? selectedArea;
  bool isPhoneValid = false;
  bool isNameValid = false;
  bool isDobValid = false;
  String phoneNoValue = '';
  String fullName = '';
  String dob = '';
  String emailId = '';
  bool isSubmitButtonEnable = false;
  bool isVerifyButtonEnable = false;
  bool isNextButtonEnable = false;
  bool isContinueButtonEnable = false;
  bool isEmailValid = false;

  CitiesResponse? citiesResponse;
  CitiesResponse? areasResponse;

  var apiClient = ApiClient();

  List<DropdownMenuItem<CitiesData>> citiesList = [];
  List<DropdownMenuItem<CitiesData>> areaList = [];

  @override
  void onInit() async {
    await getCities();
    super.onInit();
  }

  Future<void> getCities() async {
    var res = await apiClient.getCities(isLoading: false);
    if (!res.hasError) {
      citiesResponse = citiesResponseFromJson(res.data);
      if (citiesResponse != null &&
          citiesResponse!.data != null &&
          citiesResponse!.data!.isNotEmpty) {
        for (var i = 0; i < citiesResponse!.data!.length; i++) {
          citiesList.add(
            DropdownMenuItem(
              child: Padding(
                padding: Dimens.edgeInsets16_0_0_0,
                child: Text('${citiesResponse!.data![i].name}'),
              ),
              value: citiesResponse!.data![i],
            ),
          );
        }
      }
    }
    update();
  }

  Future<void> getAreas() async {
    var res = await apiClient.getAreas(
        isLoading: true, cityId: '${selectedCity?.id}');
    if (!res.hasError) {
      areasResponse = citiesResponseFromJson(res.data);
      if (areasResponse != null &&
          areasResponse!.data != null &&
          areasResponse!.data!.isNotEmpty) {
        for (var i = 0; i < areasResponse!.data!.length; i++) {
          areaList.add(
            DropdownMenuItem(
              child: Padding(
                padding: Dimens.edgeInsets16_0_0_0,
                child: Text('${areasResponse!.data![i].name}'),
              ),
              value: areasResponse!.data![i],
            ),
          );
        }
      }
    }
    update();
  }

  /// Check if the Phone is valid or not.
  void checkIfPhoneIsValid(String phone) {
    phoneNoValue = phone;
    if (phone.isEmpty) {
      isPhoneValid = false;
      phoneNoErrorText = StringConstants.thisFieldIsRequired;
    } else {
      isPhoneValid = phone.isNotEmpty && phone.length == 10;
      phoneNoErrorText =
          isPhoneValid ? null : StringConstants.pleaseEnterValidPhone;
    }
    enableSubmitButton();
  }

  /// Check if the email is valid or not.
  void checkIfEmailIsValid(String email) {
    if (email.isEmpty) {
      isEmailValid = false;
      emailErrorText = StringConstants.thisFieldIsRequired;
    } else {
      isEmailValid = Utility.emailValidator(email);
      emailErrorText =
          isEmailValid ? null : StringConstants.pleaseEnterValidEmail;
    }
    emailId = email;
    enableNextButton();
  }

  /// Check if the name is valid or not.
  void checkIfFullNameIsValid(String name) {
    fullName = name;
    if (name.isEmpty) {
      isNameValid = false;
      fullNameErrorText = StringConstants.thisFieldIsRequired;
    } else {
      isNameValid = name.isNotEmpty;
      fullNameErrorText =
          isNameValid ? null : StringConstants.pleaseEnterValidPhone;
    }
    enableNextButton();
  }

  /// Check if the dob is valid or not.
  void checkIfDOBIsValid(String name) {
    dob = name;
    if (name.isEmpty) {
      isDobValid = false;
      dobErrorText = StringConstants.thisFieldIsRequired;
    } else {
      isDobValid = name.isNotEmpty;
      dobErrorText = isDobValid ? null : StringConstants.pleaseEnterValidPhone;
    }
    update();
  }

  /// Enable or disable the submit based on [phoneNoValue].
  void enableSubmitButton() {
    isSubmitButtonEnable = isPhoneValid;
    update();
  }

  Future<void> login() async {
    await GetStorage('appData').write(AppConstants.showOnBoarding, 'true');
    var res =
        await apiClient.login(mobileNumber: phoneNoValue, isLoading: true);
    if (!res.hasError) {
      var data = loginResponseFromJson(res.data);
      printInfo(info: data.toString());
      RouteManagement.goToOtpVerification();
    } else {
      dynamic data = jsonDecode(res.data);
      Utility.showErrorDialog(data['message'][0] as String);
    }
  }

  Future<void> updateUser() async {
    var res = await apiClient.updateUser(
        email: emailId,
        fullName: fullName,
        dob: dob.isNotEmpty
            ? Jiffy.parse(dob, pattern: 'dd/MM/yyyy',isUtc: true).format(pattern: 'yyyy-MM-dd')
            : null,
        city: '${selectedCity?.name}',
        area: '${selectedArea?.name}',
        isLoading: true);
    if (!res.hasError) {
      await GetStorage('appData')
          .write(AppConstants.isProfileCompleted, 'true');
      RouteManagement.goToHome();
    }
  }

  Future<void> verifyOtp({required String otp}) async {
    var res = await apiClient.verifyOTP(
        mobileNumber: phoneNoValue, otp: otp, isLoading: true);
    if (!res.hasError) {
      dynamic data = jsonDecode(res.data);
      if (data['errorCode'] == 1014) {
        Utility.showErrorDialog(
          data['message'] as String,
        );
      } else {
        var data = verifyOtpResponseFromJson(res.data);
        if (data.data != null && data.data?.id != null) {
          await GetStorage('appData')
              .write(AppConstants.token, '${data.data?.accessToken}');
          await GetStorage('appData')
              .write(AppConstants.userId, '${data.data?.id}');
          await GetStorage('appData').write(AppConstants.isProfileCompleted,
              '${data.data?.isProfileCompleted}');
          if (data.data!.isProfileCompleted == true) {
            RouteManagement.goToHome();
          } else {
            RouteManagement.goToTellUsAboutYourself();
          }
        }
      }
    } else {
      dynamic data = jsonDecode(res.data);
      Utility.showErrorDialog(data['message'][0] as String);
    }
  }

  /// Enable or disable the submit based on [phoneNoValue].
  void enableContinueButton() {
    isContinueButtonEnable = selectedArea != null && selectedCity != null;
    update();
  }

  void enableNextButton() {
    isNextButtonEnable = isNameValid;
    update();
  }
}
