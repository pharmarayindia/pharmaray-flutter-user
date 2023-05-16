import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class LocateYourAddress extends StatelessWidget {
  const LocateYourAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<LoginController>(
        builder: (_controller) => Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: Dimens.percentWidth(1),
                  height: Dimens.percentHeight(1),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AssetConstants.loginBack,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: Dimens.eighteen,
                  top: Dimens.hundred,
                  child: Image.asset(AssetConstants.login1),
                  width: Dimens.eighty,
                  height: Dimens.eighty,
                ),
                Positioned(
                  right: Dimens.oneHundredFifty,
                  top: Dimens.sixty,
                  child: Image.asset(AssetConstants.login2),
                  width: Dimens.sixty,
                  height: Dimens.sixty,
                ),
                Positioned(
                  right: Dimens.fourty,
                  top: Dimens.twoHundredTwentyEight,
                  child: Image.asset(AssetConstants.login4),
                  width: Dimens.seventy,
                  height: Dimens.seventy,
                ),
                Positioned(
                  right: Dimens.oneSixty,
                  top: Dimens.oneSixty,
                  child: Image.asset(AssetConstants.login3),
                  width: Dimens.fourtyThree,
                  height: Dimens.fourtyThree,
                ),
                Positioned(
                  left: Dimens.eighteen,
                  top: Dimens.threeNineteen,
                  right: Dimens.eighteen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.locateYourAddress,
                        style: Styles.primaryMedium28,
                      ),
                      Dimens.boxHeight30,
                      Text(
                        StringConstants.selectYourCity,
                        style: Styles.lightGrey14,
                      ),
                      Dimens.boxHeight10,
                      Container(
                        width: Dimens.percentWidth(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.ten),
                            ),
                            color: Colors.white),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<dynamic>(
                            icon: Padding(
                              padding: Dimens.edgeInsets0_0_5_0,
                              child: Image.asset(
                                AssetConstants.dropDown,
                                width: Dimens.eighteen,
                                height: Dimens.eighteen,
                              ),
                            ),
                            value: _controller.selectedCity,
                            items: _controller.citiesList,
                            hint: Padding(
                              padding: Dimens.edgeInsets16_0_0_0,
                              child: Text(
                                StringConstants.select,
                                style: Styles.lightGrey16,
                              ),
                            ),
                            onChanged: (dynamic value) {
                              _controller.selectedCity = value as CitiesData;
                              _controller.getAreas();
                              _controller.enableContinueButton();
                              _controller.update();
                            },
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Text(
                        StringConstants.selectYourArea,
                        style: Styles.lightGrey14,
                      ),
                      Dimens.boxHeight10,
                      Container(
                        width: Dimens.percentWidth(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.ten),
                            ),
                            color: Colors.white),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<dynamic>(
                            icon: Padding(
                              padding: Dimens.edgeInsets0_0_5_0,
                              child: Image.asset(
                                AssetConstants.dropDown,
                                width: Dimens.eighteen,
                                height: Dimens.eighteen,
                              ),
                            ),
                            value: _controller.selectedArea,
                            items: _controller.areaList,
                            hint: Padding(
                              padding: Dimens.edgeInsets16_0_0_0,
                              child: Text(
                                StringConstants.select,
                                style: Styles.lightGrey16,
                              ),
                            ),
                            onChanged: (dynamic value) {
                              _controller.selectedArea = value as CitiesData;
                              _controller.enableContinueButton();
                              _controller.update();
                            },
                          ),
                        ),
                      ),
                      Dimens.boxHeight30,
                      FormSubmitWidget(
                        text: StringConstants.continueTo,
                        textStyle: Styles.whiteLight16,
                        padding: Dimens.edgeInsets10_0_10_0,
                        buttonColor: _controller.isContinueButtonEnable
                            ? AppColors.primaryColor
                            : AppColors.buttonDisableColor,
                        onTap: _controller.isContinueButtonEnable
                            ? () {
                                _controller.updateUser();
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
