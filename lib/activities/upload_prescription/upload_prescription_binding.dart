import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class UploadPrescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(UploadPrescriptionController.new);
  }
}
