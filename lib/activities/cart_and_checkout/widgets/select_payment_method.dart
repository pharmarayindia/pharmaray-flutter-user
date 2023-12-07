import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SelectPaymentMethod extends StatefulWidget {
  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  var args = Get.arguments as Map<String, dynamic>;
  int selectedPaymentMethod = 0;
  bool isFromPickup = false;
  num deliveryCharges = 0;
  num lastAmountWithoutCharges = 0;
  String coupenCode = "";
  var homeController = Get.find<HomeController>();
  List<String> listOfMethods = [
    StringConstants.online,
    StringConstants.cashOnDelivery
  ];
  late Razorpay razorpay;

  @override
  void initState() {
    isFromPickup = args['isFromPickup'] as bool? ?? false;
    deliveryCharges = args['deliveryCharge'] as num? ?? 0;
    coupenCode = args['coupenCode'] as String? ?? "";

    lastAmountWithoutCharges = double.parse(homeController.cartTotalResponse!.data!.grandTotal.toString()) - double.parse(deliveryCharges.toString());
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);

    super.initState();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    Utility.closeDialog();
    var list = <dynamic>[];
    for (var i = 0;
    i < homeController.cartResponse!.data!.length;
    i++) {
      list.add({
        'productId':
        '${homeController.cartResponse?.data?[i].productId}',
        'quantity': num.parse(
            '${homeController.cartResponse?.data?[i].quantity}')
      });
    }
    var res = await homeController.createOrder(
        loading: true,
        cartItems: list,
        orderPlacedType: isFromPickup ? 'Self/pickup' : 'Home',
        userAddressId: int.parse(
            '${homeController.addressesResponse?.data?[homeController.selectedAddress].id}'),
        couponCode: coupenCode == null ? null : coupenCode);
    if (res == true) {
      var res = await homeController.transactions(
          loading: true,
          paymentResponse: response.toString(),
          paymentMode: selectedPaymentMethod);
      if (res == true) {
        var res1 = await homeController.completeOrder(
            loading: true,
            paymentResponse: response.toString(),
            paymentMode: selectedPaymentMethod);
        if (res1 !=  null) {
          dynamic data = jsonDecode(res1);
          RouteManagement.goToOrderSuccess(
              orderId: (data['data']['id']).toString());
        }
      }
    }

  }

  void handlePaymentError(PaymentFailureResponse response) {
    Utility.closeDialog();
    RouteManagement.goToOrderFailure();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('External SDK Response: $response');
  }

  void openCheckout({required String description}) async {
    var options = {
      'key': AppConstants.razorPayKey,
      'amount': (num.parse(
          lastAmountWithoutCharges.toString()) *
          100).floor(),
      'name': 'Pharmaray',
      'description': description,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '${homeController.profileResponse?.data?.mobile}',
        'email': '${homeController.profileResponse?.data?.email}'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
          child: CustomAppBar(
            title: StringConstants.paymentMethod,
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: listOfMethods.length,
              padding: Dimens.edgeInsets15,
              itemBuilder: (context, index) => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Dimens.twentyFour,
                          height: Dimens.twentyFour,
                          child: Radio(
                            activeColor: AppColors.primaryColor,
                            value: index,
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              selectedPaymentMethod = index;
                              setState(() {});
                            },
                          ),
                        ),
                        Dimens.boxWidth10,
                        index == 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    listOfMethods[index],
                                    style: selectedPaymentMethod == index
                                        ? Styles.boldBlack16W700
                                        : Styles.boldBlack16,
                                  ),
                                  Text(
                                    StringConstants.onlineSubTitle,
                                    style: Styles.paymentColor,
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    listOfMethods[index],
                                    style: selectedPaymentMethod == index
                                        ? Styles.boldBlack16W700
                                        : Styles.boldBlack16,
                                  ),
                                  Text(
                                    StringConstants.cashOnDeliverySubtitle,
                                    style: Styles.paymentColor,
                                  ),
                                ],
                              ),
                      ],
                    ),
                    Dimens.boxHeight30,
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: Dimens.edgeInsets20,
              child: FormSubmitWidget(
                text: StringConstants.continue1,
                textStyle: Styles.whiteLight16,
                padding: Dimens.edgeInsets10_0_10_0,
                buttonColor: AppColors.primaryColor,
                onTap: () async {
                  if (selectedPaymentMethod != -1 &&
                      selectedPaymentMethod == 0) {
                    Utility.showLoadingDialog();
                    openCheckout(description: StringConstants.online);
                  } else {
                    var list = <dynamic>[];
                    for (var i = 0;
                    i < homeController.cartResponse!.data!.length;
                    i++) {
                      list.add({
                        'productId':
                        '${homeController.cartResponse?.data?[i].productId}',
                        'quantity': num.parse(
                            '${homeController.cartResponse?.data?[i].quantity}')
                      });
                    }
                    var res = await homeController.createOrder(
                        loading: true,
                        cartItems: list,
                        orderPlacedType: isFromPickup ? 'Self/pickup' : 'Home',
                        userAddressId: (homeController.addressesResponse!.data!.isNotEmpty) ? int.parse(
                            '${homeController.addressesResponse?.data?[homeController.selectedAddress].id}'): 0,
                        couponCode: coupenCode == null ? null : coupenCode);
                    if (res == true) {
                      var res = await homeController.transactions(
                          loading: true,
                          paymentResponse: '',
                          paymentMode: selectedPaymentMethod);
                      if (res == true) {
                        var res1 = await homeController.completeOrder(
                            loading: true,
                            paymentResponse: '',
                            paymentMode: selectedPaymentMethod);
                        if (res1 !=  null) {
                          dynamic data = jsonDecode(res1);
                          RouteManagement.goToOrderSuccess(
                              orderId: (data['data']['id']).toString());
                        }
                      }
                    }
                  }
                },
              ),
            ),
          ],
        ),
      );
}
