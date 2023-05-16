import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmaray/lib.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    goToHomePage(true);
    super.onInit();
  }

  void goToHomePage(bool shouldWait) async {
    var showOnBoarding =
        GetStorage('appData').read<String?>(AppConstants.showOnBoarding);
    var userId = GetStorage('appData').read<String?>(AppConstants.userId);
    var isProfileCompleted =
        GetStorage('appData').read<String?>(AppConstants.isProfileCompleted);
    if (showOnBoarding == null || showOnBoarding == '') {
      Future<dynamic>.delayed(
          const Duration(
            seconds: 2,
          ),
          RouteManagement.goToOnBoarding);
    } else if (userId != null && userId != '') {
      if (isProfileCompleted != null &&
          isProfileCompleted != '' &&
          isProfileCompleted == 'true') {
        Future<dynamic>.delayed(
            const Duration(
              seconds: 2,
            ),
            RouteManagement.goToHome);
      } else if (isProfileCompleted == 'false') {
        Future<dynamic>.delayed(
            const Duration(
              seconds: 2,
            ),
            RouteManagement.goToTellUsAboutYourself);
      }
    } else {
      Future<dynamic>.delayed(
          const Duration(
            seconds: 2,
          ),
          RouteManagement.goToLogin);
    }
  }
}
