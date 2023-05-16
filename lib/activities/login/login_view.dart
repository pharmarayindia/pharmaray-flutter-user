import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
                      Image.asset(
                        AssetConstants.login5,
                        width: Dimens.seventy,
                        height: Dimens.seventy,
                      ),
                      Dimens.boxHeight20,
                      Image.asset(
                        AssetConstants.login6,
                        width: Dimens.threeNineteen,
                        height: Dimens.thirtyFour,
                      ),
                      Dimens.boxHeight30,
                      Text(
                        StringConstants.contactNumber,
                        style: Styles.lightGrey14,
                      ),
                      Dimens.boxHeight10,
                      FormFieldWidget(
                        fillColor: Colors.white.withOpacity(.8),
                        contentPadding: Dimens.edgeInsets16,
                        textInputType: TextInputType.phone,
                        onChange: _controller.checkIfPhoneIsValid,
                        maxLength: 10,
                        suffixIcon:_controller.isPhoneValid? Padding(
                          padding: EdgeInsets.only(right: Dimens.ten),
                          child: Image.asset(
                            AssetConstants.doneCircle,
                            width: Dimens.fifteen,
                            height: Dimens.fifteen,
                          ),
                        ):null,
                      ),
                      Dimens.boxHeight30,
                      FormSubmitWidget(
                        text: StringConstants.getVerificationCode,
                        textStyle: Styles.whiteLight16,
                        padding: Dimens.edgeInsets10_0_10_0,
                        buttonColor: _controller.isSubmitButtonEnable
                            ? AppColors.primaryColor
                            : AppColors.buttonDisableColor,
                        onTap: _controller.isSubmitButtonEnable
                            ? _controller.login
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
