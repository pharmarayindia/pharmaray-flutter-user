import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
    );
  }
}
