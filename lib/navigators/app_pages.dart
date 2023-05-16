import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 250,
  );
  static const initial = Routes.splash;

  static final pages = [
    GetPage<dynamic>(
      name: _Paths.splash,
      transitionDuration: transitionDuration,
      page: SplashView.new,
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.login,
      transitionDuration: transitionDuration,
      page: LoginView.new,
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.otpVerificationView,
      transitionDuration: transitionDuration,
      page: OtpVerificationView.new,
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.tellUsAboutYourself,
      transitionDuration: transitionDuration,
      page: TellUsAboutYourSelf.new,
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.locateYourAddress,
      transitionDuration: transitionDuration,
      page: LocateYourAddress.new,
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.onBoarding,
      transitionDuration: transitionDuration,
      page: OnBoardingView.new,
      binding: OnBoardingBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.home,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.addAddress,
      transitionDuration: transitionDuration,
      page: AddAddressView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.searchMedicines,
      transitionDuration: transitionDuration,
      page: SearchMedicines.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.cartAndCheckout,
      transitionDuration: transitionDuration,
      page: CartAndCheckoutView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.pickUpAddress,
      transitionDuration: transitionDuration,
      page: PickupAddressMapView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.selectPaymentMethod,
      transitionDuration: transitionDuration,
      page: SelectPaymentMethod.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.orderSuccess,
      transitionDuration: transitionDuration,
      page: OrderSuccess.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.orderFailure,
      transitionDuration: transitionDuration,
      page: OrderFailure.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.medicineList,
      transitionDuration: transitionDuration,
      page: MedicineList.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.medicineDetail,
      transitionDuration: transitionDuration,
      page: MedicineDetailView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.orders,
      transitionDuration: transitionDuration,
      page: OrdersView.new,
      binding: OrdersBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.contactPharmacy,
      transitionDuration: transitionDuration,
      page: ContactPharmacy.new,
      binding: ContactPharmacyBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.savedAddresses,
      transitionDuration: transitionDuration,
      page: SavedAddresses.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.pathologyTest,
      transitionDuration: transitionDuration,
      page: PathologyTestView.new,
      binding: PathologyTestBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.addressBook,
      transitionDuration: transitionDuration,
      page: AddressBookView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.uploadPrescription,
      transitionDuration: transitionDuration,
      page: UploadPrescriptionView.new,
      binding: UploadPrescriptionBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.howToUpload,
      transitionDuration: transitionDuration,
      page: HowToUpload.new,
      binding: UploadPrescriptionBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.orderFromPrescription,
      transitionDuration: transitionDuration,
      page: OrderFromPrescription.new,
      binding: UploadPrescriptionBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.orderSummary,
      transitionDuration: transitionDuration,
      page: OrderSummary.new,
      binding: OrdersBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.pathologyTestDetail,
      transitionDuration: transitionDuration,
      page: PathologyTestDetail.new,
      binding: PathologyTestBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.uploadPrescriptionSuccess,
      transitionDuration: transitionDuration,
      page: UploadPrescriptionSuccess.new,
      binding: UploadPrescriptionBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.addReminder,
      transitionDuration: transitionDuration,
      page: AddReminderView.new,
      binding: AddReminderBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.reminderSuccess,
      transitionDuration: transitionDuration,
      page: ReminderSuccess.new,
      transition: Transition.rightToLeft,
    ),
  ];
}