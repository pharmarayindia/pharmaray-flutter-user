import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<SplashController>(
        builder: (_controller) => Scaffold(
          backgroundColor: AppColors.backgroundColor,
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Container(
            width: Dimens.percentWidth(1),
            height: Dimens.percentHeight(1),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetConstants.splash),
                fit: BoxFit.fill
              ),
            ),
          ),
        ),
      );
}
