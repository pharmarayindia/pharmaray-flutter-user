import 'package:get/get.dart';

class PathologyTestController extends GetxController {
  int selectedTab = 0;

  void onTapTab(int index) {
    selectedTab = index;
    update();
  }
}
