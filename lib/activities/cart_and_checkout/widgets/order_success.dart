import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmaray/lib.dart';

class OrderSuccess extends StatefulWidget {
  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  var args = Get.arguments as String? ?? '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    RouteManagement.goToOrderSummary(orderId: args);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.percentWidth(.7),
                  height: Dimens.percentHeight(.6),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Lottie.asset(
                      AssetConstants.orderSuccess,
                    ),
                  ),
                ),
              ],
            ),
            Dimens.boxHeight20,
            Text(
              StringConstants.orderPlacedSuccessfully,
              style: Styles.black20,
            ),
          ],
        ),
      );
}
