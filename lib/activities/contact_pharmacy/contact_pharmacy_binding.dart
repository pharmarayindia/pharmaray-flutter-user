import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class ContactPharmacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ContactPharmacyController.new);
  }
}
