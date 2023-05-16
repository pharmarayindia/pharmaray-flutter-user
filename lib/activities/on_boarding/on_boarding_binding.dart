import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(OnBoardingController.new);
  }
}
