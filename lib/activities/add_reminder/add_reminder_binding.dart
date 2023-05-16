import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class AddReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AddReminderController.new);
  }
}
