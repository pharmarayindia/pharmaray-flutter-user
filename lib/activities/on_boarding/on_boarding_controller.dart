import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class OnBoardingController extends GetxController {
  final PageController controller = PageController();

  int currentOnBoardingPage = 0;

  final onBoardingItemList = [
    {
      'image': AssetConstants.onBoarding1,
      'titleImage': AssetConstants.onBoarding5,
      'subtitle'.tr: StringConstants.onBoardingSubtitle1,
      'height': Dimens.twentyTwo,
    },
    {
      'image': AssetConstants.onBoarding2,
      'titleImage': AssetConstants.onBoarding6,
      'subtitle'.tr: StringConstants.onBoardingSubtitle2,
      'width': Dimens.percentWidth(.73),
      'height': Dimens.twentyTwo,
    },
    {
      'image': AssetConstants.onBoarding3,
      'titleImage': AssetConstants.onBoarding7,
      'subtitle'.tr: StringConstants.onBoardingSubtitle3,
      'width': Dimens.percentWidth(.5),
      'height': Dimens.twenty,
    },
    {
      'image': AssetConstants.onBoarding4,
      'titleImage': AssetConstants.onBoarding8,
      'subtitle'.tr: StringConstants.onBoardingSubtitle4,
      'height': Dimens.twentyTwo,
    },
  ];
}
