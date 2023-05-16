import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(LoginController.new);
  }
}
