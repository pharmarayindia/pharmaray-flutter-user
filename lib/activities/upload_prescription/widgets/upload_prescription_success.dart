import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmaray/lib.dart';

class UploadPrescriptionSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: Dimens.percentWidth(1),
          height: Dimens.percentHeight(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dimens.boxHeight50,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Dimens.percentWidth(.5),
                        height: Dimens.percentHeight(.2),
                        child: Lottie.asset(
                          AssetConstants.orderSuccess,
                        ),
                      ),
                      Text(
                        StringConstants.prescriptionUploadedSuccessfully,
                        style: Styles.boldBlack16,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: Dimens.edgeInsets20,
                child: InkWell(
                  onTap: () {
                    Phoenix.rebirth(context);
                    RouteManagement.goToHome();
                  },
                  child: Container(
                    width: Dimens.percentWidth(1),
                    height: Dimens.fifty,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimens.eight,
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          StringConstants.goToHome,
                          style: Styles.boldWhite16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
