import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class PathologyTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(PathologyTestController.new);
  }
}
