import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(OrdersController.new);
  }
}
