import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class AddReminderController extends GetxController {
  String startDate = 'Add date';
  String startDateToSend = 'Add date';
  String endDate = 'Add date';
  String endDateToSend = 'Add date';
  var apiClient = ApiClient();
  String diff = '-';
  var homeController = Get.find<HomeController>();

  Future<void> addReminder({
    required bool loading,
    required String reminderName,
    required String startDate,
    required String endDate,
    required bool beforeMeal,
    required num numberOfTablets,
    required String reminderTime,
    required String reminderLabel,
  }) async {
    var res = await apiClient.addReminder(
        loading: loading,
        reminderName: reminderName,
        startDate: startDate,
        endDate: endDate,
        beforeMeal: beforeMeal,
        numberOfTablets: numberOfTablets,
        reminderTime: reminderTime,
        reminderLabel: reminderLabel);
    if (!res.hasError) {
      await homeController.getReminders(loading: true);
      Get.back<dynamic>();
    }
    update();
  }

  int differenceInDays() {
    if (startDate != 'Add date' && endDate != 'Add date') {
      var date1 = DateTime(
          int.parse(startDate.split(' / ')[2]),
          int.parse(startDate.split(' / ')[1]),
          int.parse(startDate.split(' / ')[0]));
      var date2 = DateTime(
          int.parse(endDate.split(' / ')[2]),
          int.parse(endDate.split(' / ')[1]),
          int.parse(endDate.split(' / ')[0]));
      diff = date2.difference(date1).inDays.toString();
      return date2.difference(date1).inDays;
    } else {
      return 0;
    }
  }
}
