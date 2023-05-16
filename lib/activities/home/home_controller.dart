import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pharmaray/lib.dart';

class HomeController extends GetxController {
  SelectedAddressType? selectedAddressType;
  int selectedIndex = 0;
  List<SelectedAddressType> addressItems = [
    SelectedAddressType(1, StringConstants.home),
    SelectedAddressType(2, StringConstants.work),
  ];
  String? token;
  int selectedAddress = -1;
  CitiesResponse? citiesResponse;
  CartResponse? cartResponse;
  VerifyOtpResponse? profileResponse;
  UserSavedAddresses? addressesResponse;
  SearchPageListResponse? searchPageListResponse;
  CitiesResponse? areasResponse;
  ProductDetailsResponse? productDetailsResponse;
  SearchMedicineResponse? searchMedicineResponse;
  List<Source> recentlyViewedResponse = [];
  HomePageResponse? homePageResponse;
  List<HomeWidgetData> homeWidgetDataBanner = [];
  List<HomeWidgetData> homeWidgetDataGrid = [];
  List<StorePageData> storePageList = [];
  List<Widget> homeWidgetBanner = [];
  RemindersListResponse? remindersListResponse;
  int selectedGridItem = -1;
  CartTotalResponse? cartTotalResponse;
  CreateOrderResponse? createOrderResponse;

  CitiesData? selectedCity;
  CitiesData? selectedArea;

  int storeSkip = 0;
  int storeLimit = 10;

  final PageController controller = PageController();
  int currentItemPage = 0;

  var apiClient = ApiClient();

  List<DropdownMenuItem<CitiesData>> citiesList = [];
  List<DropdownMenuItem<CitiesData>> areaList = [];

  List<DropdownMenuItem<SelectedAddressType>> addressItemsToShow = [];

  List<DropdownMenuItem<SelectedAddressType>> buildDropDownMenuItems(
      List<SelectedAddressType> listItems) {
    var items = <DropdownMenuItem<SelectedAddressType>>[];
    for (var listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: Dimens.edgeInsets16_0_0_0,
            child: Text(listItem.data),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Widget getItemWidget(int pos) {
    switch (pos) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            children: [
              HomeWidget(),
            ],
          ),
        );
      case 1:
        return ReminderWidget();
      case 2:
        return SingleChildScrollView(
          child: Column(
            children: [
              StoreWidget(),
            ],
          ),
        );
      case 3:
        return SingleChildScrollView(
          child: Column(
            children: [
              AccountWidget(),
            ],
          ),
        );
      default:
        return const Text('Error');
    }
  }

  @override
  void onInit() async {
    addressItemsToShow = buildDropDownMenuItems(addressItems);
    getCities();
    getReminders(loading: false);
    getCartItems(isLoading: false);
    getAddresses(isLoading: false);
    homeData(pageType: null, isLoading: false);
    recentlyViewed(loading: false);
    getSearchPageList();
    getProfile(loading: false);
    var locRequest = await Permission.notification.request();
    print(locRequest);
    await FirebaseMessaging.instance.getToken().then((value) {
      token = value;
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var notification = message.notification as RemoteNotification;
      // var androidNotification = event.notification?.android;
      // debugPrint(androidNotification.toString());
      flutterLocalNotificationsPlugin.show(notification.hashCode,
          notification.title, notification.body, const NotificationDetails());
      Get.snackbar(
        notification.title.toString(),
        notification.body.toString(),
        backgroundColor: AppColors.primaryColor,
        titleText: Text(
          notification.title.toString(),
          style: Styles.boldWhite16,
        ),
        messageText: Text(
          notification.body.toString(),
          style: Styles.mediumWhite16,
        ),
        duration: const Duration(seconds: 15),
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        var notification = message.notification;
        var android = message.notification?.android;
        if (notification != null && android != null) {}
      },
    );
    if (Platform.isAndroid) {
      var status = await Permission.notification.request();
      print('statusstatusstatusstatus $status');
    }
    updateFcmToken();
    super.onInit();
  }

  Future<void> updateFcmToken() async {
    var res = await apiClient.updateFcm(fcmToken: token, loading: false);
    if (!res.hasError) {
      debugPrint(res.data);
    }
  }

  Future<void> getAreas() async {
    var res = await apiClient.getAreas(
        isLoading: false, cityId: '${selectedCity?.id}');
    if (!res.hasError) {
      areasResponse = citiesResponseFromJson(res.data);
      if (areasResponse != null &&
          areasResponse!.data != null &&
          areasResponse!.data!.isNotEmpty) {
        for (var i = 0; i < areasResponse!.data!.length; i++) {
          areaList.add(
            DropdownMenuItem(
              child: Padding(
                padding: Dimens.edgeInsets16_0_0_0,
                child: Text('${areasResponse!.data![i].name}'),
              ),
              value: areasResponse!.data![i],
            ),
          );
        }
      }
    }
    update();
  }

  Future<void> updateAddress(
      {required String fullName,
      required String contactNumber,
      required String line1,
      required String line2,
      required String landmark,
      required String city,
      required String state,
      required String country,
      required String pinCode,
      required String type,
      required String area,
      required bool isDefault,
      required bool isLoading}) async {
    var res = await apiClient.addAddress(
        fullName: fullName,
        contactNumber: contactNumber,
        line1: line1,
        line2: line2,
        area: area,
        landmark: landmark,
        city: city,
        type: type,
        state: state,
        country: country,
        pinCode: pinCode,
        isDefault: isDefault,
        isLoading: isLoading);
    if (!res.hasError) {
      Get.back<dynamic>();
      await getAddresses(isLoading: true);
    }
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    selectedGridItem = -1;
    update();
  }

  Future<bool?> getCartTotals(
      {required bool loading,
      required String? couponCode,
      required dynamic list}) async {
    var res = await apiClient.getCartTotals(
        cartItems: list, loading: loading, couponCode: couponCode);
    if (!res.hasError) {
      dynamic a = jsonDecode(res.data);
      if (a['errorCode'] == 1021 || a['errorCode'] == 1022) {
        update();
        Utility.showInfoDialog(res, isSuccess: false);
        return false;
      } else {
        var data = cartTotalResponseFromJson(res.data);
        cartTotalResponse = data;
        update();
        return true;
      }
    } else {
      Utility.showInfoDialog(res);
      update();
      return true;
    }
  }

  Future<bool> createOrder(
      {required bool loading,
      required dynamic cartItems,
      required int userAddressId,
      required String? orderPlacedType,
      required String? couponCode}) async {
    var res = await apiClient.createOrder(
        cartItems: cartItems,
        loading: loading,
        orderPlacedType: orderPlacedType,
        userAddressId: userAddressId,
        couponCode: couponCode);
    if (!res.hasError) {
      var data = createOrderResponseFromJson(res.data);
      createOrderResponse = data;
      return true;
    } else {
      Utility.showInfoDialog(res);
      return false;
    }
  }

  Future<bool> transactions(
      {required bool loading,
      required dynamic paymentResponse,
      required int paymentMode}) async {
    var res = await apiClient.transactions(
        loading: loading,
        orderId: int.parse('${createOrderResponse?.data?.order?.id}'),
        amount: num.parse('${cartTotalResponse?.data?.grandTotal}'),
        paymentMode: paymentMode,
        paymentResponse: paymentResponse);
    if (!res.hasError) {
      return true;
    } else {
      Utility.showInfoDialog(res);
      return false;
    }
  }

  Future<String?> completeOrder(
      {required bool loading,
      required dynamic paymentResponse,
      required int paymentMode}) async {
    var res = await apiClient.completeOrder(
        loading: loading,
        orderId: int.parse('${createOrderResponse?.data?.order?.id}'),
        amount: num.parse('${cartTotalResponse?.data?.grandTotal}'),
        paymentMode: paymentMode,
        paymentResponse: paymentResponse);
    if (!res.hasError) {
      return res.data;
    } else {
      Utility.showInfoDialog(res);
      return null;
    }
  }

  Future<void> deleteAddress(
      {required bool loading, required String addressId}) async {
    var res =
        await apiClient.deleteAddress(isLoading: loading, addressId: addressId);
    if (!res.hasError) {
      if (res.errorCode != null && res.errorCode == 200) {
        await getAddresses(isLoading: true);
      }
    }
  }

  Future<void> getReminders({required bool loading}) async {
    var res = await apiClient.getReminders(isLoading: loading);
    if (!res.hasError) {
      var data = remindersListResponseFromJson(res.data);
      remindersListResponse = data;
    }
    update();
  }

  Future<void> deleteReminder(
      {required bool loading, required num? reminderId}) async {
    var res = await apiClient.deleteReminder(
        loading: loading, reminderId: reminderId);
    if (!res.hasError) {
      await getReminders(loading: true);
    }
    update();
  }

  Future<void> getCities() async {
    citiesList.clear();
    var res = await apiClient.getCities(isLoading: false);
    if (!res.hasError) {
      citiesResponse = citiesResponseFromJson(res.data);
      if (citiesResponse != null &&
          citiesResponse!.data != null &&
          citiesResponse!.data!.isNotEmpty) {
        for (var i = 0; i < citiesResponse!.data!.length; i++) {
          citiesList.add(
            DropdownMenuItem(
              child: Padding(
                padding: Dimens.edgeInsets16_0_0_0,
                child: Text('${citiesResponse!.data![i].name}'),
              ),
              value: citiesResponse!.data![i],
            ),
          );
        }
      }
    }
    update();
  }

  Future<void> getSearchPageList() async {
    var res = await apiClient.getSearchMedicineListData(isLoading: false);
    if (!res.hasError) {
      var data = searchPageListResponseFromJson(res.data);
      searchPageListResponse = data;
    }
    update();
  }

  int store = 0;
  bool isStoreLoading = false;

  Future<void> getStorePageList(
      {required String searchText,
      required bool isLoading,
      required int skip,
      required int limit}) async {
    if (store == 0) {
      isStoreLoading = true;
    }
    var res = await apiClient.storeMedicines(
        searchText: searchText, isLoading: isLoading, skip: skip, limit: limit);
    if (!res.hasError) {
      var data = storePageResponseFromJson(res.data);
      if (data.data != null) {
        var a = <StorePageData>[];
        a.addAll(data.data!);
        storePageList = a.toSet().toList();
        store = 1;
        isStoreLoading = false;
      }
    }
    update();
  }

  Future<void> productDetail({required String productId}) async {
    var res =
        await apiClient.getProductDetails(productId: productId, loading: true);
    if (!res.hasError) {
      var data = productDetailsResponseFromJson(res.data);
      productDetailsResponse = data;
    }
  }

  Future<void> getCartItems({required bool isLoading}) async {
    var res = await apiClient.getCartItems(isLoading: isLoading);
    if (!res.hasError) {
      cartResponse = cartResponseFromJson(res.data);
    }
    update();
  }

  Future<void> postRecentlyViewed(
      {required bool isLoading, required String productId}) async {
    var res = await apiClient.addToRecentlyViewed(
        productId: num.parse(productId), isLoading: isLoading);
    if (!res.hasError) {
      await recentlyViewed(loading: false);
    }
    update();
  }

  Future<void> getAddresses({required bool isLoading}) async {
    var res = await apiClient.getAddresses(isLoading: isLoading);
    if (!res.hasError) {
      addressesResponse = userSavedAddressesFromJson(res.data);
      if (addressesResponse != null &&
          addressesResponse!.data != null &&
          addressesResponse!.data!.isNotEmpty) {
        selectedAddress = addressesResponse!.data!
            .indexWhere((element) => element.isDefault == true);
      }
    }
    update();
  }

  num? widgetId = -1;

  Future<void> searchMedicine(
      {required String searchText,
      required bool isSearchMedicine,
      required num? widgetId}) async {
    var res = await apiClient.searchMedicine(
        searchText: searchText, isLoading: true, widgetId: widgetId);
    if (!res.hasError) {
      var data = searchMedicineResponseFromJson(res.data);
      searchMedicineResponse = data;
    }
    update();
  }

  Future<void> recentlyViewed({required bool loading}) async {
    recentlyViewedResponse.clear();
    var res = await apiClient.getRecentlyViewedItems(isLoading: loading);
    if (!res.hasError) {
      dynamic a = jsonDecode(res.data);
      for (var i = 0; i < num.parse(a['data'].length.toString()); i++) {
        recentlyViewedResponse
            .add(Source.fromJson(a['data'][i] as Map<String, dynamic>));
      }
      await getCartItems(isLoading: false);
      // recentlyViewedResponse = data;
    }
    update();
  }

  Future<void> getProfile({required bool loading}) async {
    var res = await apiClient.getProfile(isLoading: loading);
    if (!res.hasError) {
      var data = verifyOtpResponseFromJson(res.data);
      profileResponse = data;
    }
    update();
  }

  Future<void> homeData(
      {required bool isLoading, required String? pageType}) async {
    var res = await apiClient.getHomeData(
        isLoading: isLoading, pageType: pageType ?? 'home');
    if (!res.hasError) {
      var data = homePageResponseFromJson(res.data);
      homePageResponse = data;
      if (homePageResponse != null &&
          homePageResponse!.data != null &&
          homePageResponse!.data!.any((element) => element.type == 'BANNER')) {
        for (var i = 0;
            i <
                homePageResponse!.data!
                    .firstWhere((element) => element.type == 'BANNER')
                    .widgets!
                    .length;
            i++) {
          homeWidgetDataBanner.add(homePageResponse!.data!
              .firstWhere((element) => element.type == 'BANNER')
              .widgets![i]);
          homeWidgetBanner.add(
            Padding(
              padding: Dimens.edgeInsets5_0_10_0,
              child: Container(
                width: Dimens.percentWidth(1),
                height: Dimens.oneHundredFifty,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.eight),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: '${homeWidgetDataBanner[i].mediaUrl}',
                  // progressIndicatorBuilder: (context, url, downloadProgress) =>
                  //     SizedBox(
                  //   width: Dimens.twentyFour,
                  //   height: Dimens.twentyFour,
                  //   child: CircularProgressIndicator(
                  //     value: downloadProgress.progress,
                  //     color: AppColors.primaryColor,
                  //   ),
                  // ),
                  errorWidget: (context, url, dynamic error) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
          );
        }
      }
      if (homePageResponse != null &&
          homePageResponse!.data != null &&
          homePageResponse!.data!.any((element) => element.type == 'GRID')) {
        for (var i = 0;
            i <
                homePageResponse!.data!
                    .firstWhere((element) => element.type == 'GRID')
                    .widgets!
                    .length;
            i++) {
          homeWidgetDataGrid.add(homePageResponse!.data!
              .firstWhere((element) => element.type == 'GRID')
              .widgets![i]);
        }
      }
    }
    update();
  }

  Future<bool> updateItemInCart(
      {required String productId,
      required String cartQuantity,
      required bool isAddition}) async {
    debugPrint('QUANTITY $cartQuantity');
    var res = await apiClient.updateCartItems(
        productId: num.parse(productId),
        quantity: isAddition
            ? num.parse(cartQuantity) + 1
            : num.parse(cartQuantity) - 1,
        isLoading: true);
    if (!res.hasError) {
      return true;
    } else {
      return false;
    }
  }
}

class SelectedAddressType {
  SelectedAddressType(this.index, this.data);

  int index;
  String data;
}

class CartItem {
  CartItem({required this.productId, required this.quantity});

  num? productId;
  num? quantity;
}
