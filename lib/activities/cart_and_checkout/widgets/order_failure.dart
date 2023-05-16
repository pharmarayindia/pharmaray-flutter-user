import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class OrderFailure extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Dimens.boxHeight100,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetConstants.orderError,
                        width: Dimens.percentWidth(.5),
                        height: Dimens.percentHeight(.3),
                      ),
                    ],
                  ),
                  Text(
                    StringConstants.errorWhilePaying,
                    style: Styles.black20,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: Dimens.edgeInsets20,
                    child: InkWell(
                      onTap: () {
                        Get.back<dynamic>();
                        Get.back<dynamic>();
                        Get.back<dynamic>();
                      },
                      child: Container(
                        width: Dimens.percentWidth(1),
                        height: Dimens.fifty,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.eight),
                          color: AppColors.primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringConstants.backToCart,
                              style: Styles.boldWhite16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Phoenix.rebirth(context);
                          RouteManagement.goToHome();
                        },
                        child: Text(
                          StringConstants.goToHome,
                          style: Styles.primary16Bold,
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight20,
                ],
              ),
            ],
          ),
        ),
      );
}
