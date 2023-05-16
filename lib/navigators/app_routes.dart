// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const onBoarding = _Paths.onBoarding;
  static const otpVerificationView = _Paths.otpVerificationView;
  static const tellUsAboutYourself = _Paths.tellUsAboutYourself;
  static const locateYourAddress = _Paths.locateYourAddress;
  static const home = _Paths.home;
  static const addAddress = _Paths.addAddress;
  static const searchMedicines = _Paths.searchMedicines;
  static const cartAndCheckout = _Paths.cartAndCheckout;
  static const pickUpAddress = _Paths.pickUpAddress;
  static const orderSuccess = _Paths.orderSuccess;
  static const selectPaymentMethod = _Paths.selectPaymentMethod;
  static const medicineList = _Paths.medicineList;
  static const medicineDetail = _Paths.medicineDetail;
  static const orders = _Paths.orders;
  static const contactPharmacy = _Paths.contactPharmacy;
  static const orderFailure = _Paths.orderFailure;
  static const savedAddresses = _Paths.savedAddresses;
  static const pathologyTest = _Paths.pathologyTest;
  static const addressBook = _Paths.addressBook;
  static const uploadPrescription = _Paths.uploadPrescription;
  static const orderSummary = _Paths.orderSummary;
  static const howToUpload = _Paths.howToUpload;
  static const orderFromPrescription = _Paths.orderFromPrescription;
  static const pathologyTestDetail = _Paths.pathologyTestDetail;
  static const uploadPrescriptionSuccess = _Paths.uploadPrescriptionSuccess;
  static const addReminder = _Paths.addReminder;
  static const reminderSuccess = _Paths.reminderSuccess;
}

abstract class _Paths {
  static const splash = '/splash';
  static const pathologyTestDetail = '/pathologyTestDetail';
  static const uploadPrescriptionSuccess = '/uploadPrescriptionSuccess';
  static const addReminder = '/addReminder';
  static const reminderSuccess = '/reminderSuccess';
  static const login = '/login';
  static const otpVerificationView = '/otpVerificationView';
  static const onBoarding = '/onBoarding';
  static const home = '/home';
  static const addAddress = '/addAddress';
  static const searchMedicines = '/searchMedicines';
  static const cartAndCheckout = '/cartAndCheckout';
  static const pickUpAddress = '/pickUpAddress';
  static const selectPaymentMethod = '/selectPaymentMethod';
  static const orderSuccess = '/orderSuccess';
  static const orderFailure = '/orderFailure';
  static const medicineList = '/medicineList';
  static const medicineDetail = '/medicineDetail';
  static const orders = '/orders';
  static const contactPharmacy = '/contactPharmacy';
  static const savedAddresses = '/savedAddresses';
  static const pathologyTest = '/pathologyTest';
  static const addressBook = '/addressBook';
  static const uploadPrescription = '/uploadPrescription';
  static const howToUpload = '/howToUpload';
  static const orderFromPrescription = '/orderFromPrescription';
  static const orderSummary = '/orderSummary';
  static const tellUsAboutYourself = '/tellUsAboutYourself';
  static const locateYourAddress = '/locateYourAddress';
}
