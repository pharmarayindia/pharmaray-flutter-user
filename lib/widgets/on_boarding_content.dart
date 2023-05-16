import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

/// OnBoardingContent showing after splash screen image, title
/// subtitle when first time app install
///

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent(
      {Key? key,
      required this.image,
      required this.titleImage,
      required this.subTitle,
      required this.height,
      this.width})
      : super(key: key);

  final String image;
  final String titleImage;
  final double? width;
  final double height;
  final String subTitle;

  @override
  Widget build(BuildContext context) => Container(
        margin: Dimens.edgeInsets35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimens.hundred,
            ),
            SizedBox(
              width: Get.width,
              child: Image.asset(
                image,
                height: Dimens.twoFiftySeven,
                width: Dimens.twoSeventyFive,
              ),
            ),
            Dimens.boxHeight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  titleImage,
                  width: width ?? Dimens.percentWidth(.75),
                  height: height,
                ),
              ],
            ),
            Dimens.boxHeight15,
            Text(
              subTitle,
              style: Styles.lightGrey16,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
