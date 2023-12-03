import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

abstract class RouteManagement {
  static void goToSplash() {
    Get.toNamed<void>(
      Routes.splash,
    );
  }

  static void goToLogin() {
    Get.offAllNamed<void>(
      Routes.login,
    );
  }

  static void goToOnBoarding() {
    Get.offNamed<void>(
      Routes.onBoarding,
    );
  }

  static void goToOtpVerification() {
    Get.toNamed<void>(
      Routes.otpVerificationView,
    );
  }

  static void goToOrderFailure() {
    Get.toNamed<void>(
      Routes.orderFailure,
    );
  }

  static void goToAddressBook() {
    Get.toNamed<void>(
      Routes.addressBook,
    );
  }

  static void goToTellUsAboutYourself() {
    Get.toNamed<void>(
      Routes.tellUsAboutYourself,
    );
  }

  static void goToLocateYourAddress() {
    Get.toNamed<void>(
      Routes.locateYourAddress,
    );
  }

  static void goToSelectPaymentMethod(bool isFromPickup,num amount, String? coupenCode) {
    Get.toNamed<void>(
      Routes.selectPaymentMethod,arguments: <String, dynamic>{
      'isFromPickup': isFromPickup,
      'deliveryCharge': amount,
      'coupenCode': coupenCode,
    }
    );
  }

  static void goToPathologyTest() {
    Get.toNamed<void>(
      Routes.pathologyTest,
    );
  }

  static void goToAddAddress({required bool isFromCart}) {
    Get.toNamed<void>(Routes.addAddress, arguments: isFromCart);
  }

  static void goToPickUpAddressMapView(
      {required String title,
      required String subTitle,
      required bool isFromPickup,
      required num deliveryCharge,
      required String? couponCode}) {
    Get.toNamed<void>(Routes.pickUpAddress, arguments: <String, dynamic>{
      'title': title,
      'subTitle': subTitle,
      'isFromPickup': isFromPickup,
      'deliveryCharge': deliveryCharge,
      'couponCode': couponCode
    });
  }

  static void goToCartAndCheckout() {
    Get.toNamed<void>(
      Routes.cartAndCheckout,
    );
  }

  static void goToUploadPrescription() {
    Get.toNamed<void>(
      Routes.uploadPrescription,
    );
  }

  static void goToMedicineDetail({required String productId}) {
    Get.toNamed<void>(Routes.medicineDetail, arguments: productId);
  }

  static void goToOrderSummary({required String orderId}) {
    Get.offNamed<void>(Routes.orderSummary, arguments: orderId);
  }

  static void goToMedicineList({String? title}) {
    Get.toNamed<void>(Routes.medicineList, arguments: title);
  }

  static void goToHowToUpload() {
    Get.toNamed<void>(
      Routes.howToUpload,
    );
  }

  static void goToOrderFromPrescription() {
    Get.toNamed<void>(
      Routes.orderFromPrescription,
    );
  }

  static void goToSearchMedicines() {
    Get.toNamed<void>(
      Routes.searchMedicines,
    );
  }

  static void goToOrderSuccess({required String orderId}) {
    Get.toNamed<void>(
      Routes.orderSuccess,
      arguments: orderId,
    );
  }

  static void goToOrdersView() {
    Get.toNamed<void>(
      Routes.orders,
    );
  }

  static void goToUploadPrescriptionSuccess() {
    Get.toNamed<void>(
      Routes.uploadPrescriptionSuccess,
    );
  }

  static void goToSavedAddresses({required String? couponCode}) {
    Get.toNamed<void>(Routes.savedAddresses, arguments: couponCode);
  }

  static void goToReminderSuccess() {
    Get.toNamed<void>(Routes.reminderSuccess);
  }

  static void goToAddReminder() {
    Get.toNamed<void>(Routes.addReminder);
  }

  static void goToContactPharmacy() {
    Get.toNamed<void>(
      Routes.contactPharmacy,
    );
  }

  static void goToPathologyTestDetail(
      {required String title, String? subTitle, required bool isSingle}) {
    Get.toNamed<void>(Routes.pathologyTestDetail, arguments: <String, dynamic>{
      'title': title,
      'subTitle': subTitle,
      'isSingle': isSingle
    });
  }

  static void goToHome() {
    Get.offAllNamed<void>(
      Routes.home,
    );
  }
}
