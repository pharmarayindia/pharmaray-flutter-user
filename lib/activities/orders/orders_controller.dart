import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class OrdersController extends GetxController {
  List<OrderData> ordersList = [];
  var apiClient = ApiClient();
  int page = 1;
  int take = 10;
  OrderDetailsResponse? orderDetailsResponse;

  @override
  void onInit() {
    getOrders(isLoading: false);
    super.onInit();
  }

  Future<void> getOrders({required bool isLoading}) async {
    var res = await apiClient.getOrderListing(
        isLoading: isLoading, page: page, take: take);
    if (!res.hasError) {
      var data = orderListResponseFromJson(res.data);
      if (data.data != null && data.data!.isNotEmpty) {
        for (var i = 0; i < data.data!.length; i++) {
          ordersList.add(data.data![i]);
        }
      }
    }
    update();
  }

  // Future<void> getInvoice(
  //     {required bool isLoading, required dynamic orderId}) async {
  //   var res = await apiClient.getInvoice(orderId: orderId, loading: isLoading);
  //   print(res);
  //   if (!res.hasError) {
  //     // var data = orderListResponseFromJson(res.data);
  //     // if (data.data != null && data.data!.isNotEmpty) {
  //     //   for (var i = 0; i < data.data!.length; i++) {
  //     //     ordersList.add(data.data![i]);
  //     //   }
  //     // }
  //   }
  //   update();
  // }

  Future<void> reOrder(
      {required bool isLoading, required dynamic orderId}) async {
    var res = await apiClient.reOrder(orderId: orderId, loading: isLoading);
    print(res);
    if (!res.hasError) {
      await getOrders(isLoading: true);
    }else{
      Utility.showInfoDialog(res);
    }
    update();
  }

  Future<void> getOrderDetails(
      {required bool isLoading, required String orderId}) async {
    var res =
        await apiClient.getOrderDetails(isLoading: isLoading, orderId: orderId);
    if (!res.hasError) {
      var data = orderDetailsResponseFromJson(res.data);
      orderDetailsResponse = data;
    }
    update();
  }
}
