import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController otpEditingController = TextEditingController();

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
                      Dimens.boxHeight50,
                      Text(
                        StringConstants.enterOtp,
                        style: Styles.primaryMedium28,
                      ),
                      Dimens.boxHeight10,
                      Text(
                        StringConstants.otpSent,
                        style: Styles.darkGrey14,
                      ),
                      Text(
                        '+91 ${_controller.phoneNoValue}',
                        style: Styles.blackBold14,
                      ),
                      Dimens.boxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Dimens.percentWidth(.7),
                            child: PinCodeTextField(
                              length: 4,
                              autoFocus: true,
                              autoDisposeControllers: true,
                              appContext: context,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.ten),
                                  fieldHeight: Dimens.fifty,
                                  fieldWidth: Dimens.fourty,
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  activeColor: AppColors.blackColor,
                                  selectedColor: AppColors.blackColor,
                                  inactiveColor:
                                      AppColors.blackColor.withOpacity(0.4),
                                  borderWidth: Dimens.one),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              errorAnimationController: errorController,
                              controller: otpEditingController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              hintCharacter: '-',
                              keyboardType: TextInputType.number,
                              onCompleted: (v) {
                                _controller.isVerifyButtonEnable = true;
                                _controller.verifyOtp(
                                    otp: otpEditingController.text);
                                _controller.update();
                              },
                              onChanged: (value) {
                                if (otpEditingController.text.length > 3) {
                                  _controller.isVerifyButtonEnable = true;
                                } else {
                                  _controller.isVerifyButtonEnable = false;
                                }
                                _controller.update();
                              },
                              beforeTextPaste: (text) => true,
                            ),
                          ),
                        ],
                      ),
                      Dimens.boxHeight30,
                      FormSubmitWidget(
                        text: StringConstants.verify,
                        textStyle: Styles.whiteLight16,
                        padding: Dimens.edgeInsets10_0_10_0,
                        buttonColor: _controller.isVerifyButtonEnable
                            ? AppColors.primaryColor
                            : AppColors.buttonDisableColor,
                        onTap: _controller.isVerifyButtonEnable
                            ? () {
                                _controller.verifyOtp(
                                    otp: otpEditingController.text);
                              }
                            : null,
                      ),
                      Dimens.boxHeight50,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              StringConstants.resendOTP,
                              style: Styles.blackBold14,
                            ),
                          ),
                        ],
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
