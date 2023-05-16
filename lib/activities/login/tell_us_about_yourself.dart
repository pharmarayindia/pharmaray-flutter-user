import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharmaray/lib.dart';

class TellUsAboutYourSelf extends StatefulWidget {
  const TellUsAboutYourSelf({Key? key}) : super(key: key);

  @override
  State<TellUsAboutYourSelf> createState() => _TellUsAboutYourSelfState();
}

class _TellUsAboutYourSelfState extends State<TellUsAboutYourSelf> {
  var dobEditingController = TextEditingController();

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
                  left: Dimens.eighteen,
                  top: Dimens.twoHundred,
                  right: Dimens.eighteen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight60,
                      Text(
                        StringConstants.tellUsAboutYourself,
                        style: Styles.primaryMedium28,
                      ),
                      Dimens.boxHeight20,
                      Text(
                        StringConstants.fullName,
                        style: Styles.lightGrey14,
                      ),
                      Dimens.boxHeight10,
                      FormFieldWidget(
                        fillColor: Colors.white.withOpacity(.8),
                        contentPadding: Dimens.edgeInsets16,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onChange: _controller.checkIfFullNameIsValid,
                        errorText: _controller.fullNameErrorText,
                        hintText: _controller.fullName.isEmpty
                            ? StringConstants.typeNameHere
                            : null,
                        hintStyle: Styles.lightGrey16,
                      ),
                      Dimens.boxHeight20,
                      Text(
                        StringConstants.email,
                        style: Styles.lightGrey14,
                      ),
                      Dimens.boxHeight10,
                      FormFieldWidget(
                        fillColor: Colors.white.withOpacity(.8),
                        contentPadding: Dimens.edgeInsets16,
                        textInputType: TextInputType.text,
                        onChange: _controller.checkIfEmailIsValid,
                        errorText: _controller.emailErrorText,
                        hintText: _controller.emailId.isEmpty
                            ? 'eg; abc@gmail.com'
                            : null,
                        hintStyle: Styles.lightGrey16,
                      ),
                      Dimens.boxHeight20,
                      Text(
                        StringConstants.dateOfBirth,
                        style: Styles.lightGrey14,
                      ),
                      Dimens.boxHeight10,
                      FormFieldWidget(
                        isReadOnly: true,
                        textEditingController: dobEditingController,
                        onTap: () async {
                          final picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950, 8),
                              lastDate: DateTime.now());
                          if (picked != null && picked != DateTime.now()) {
                            _controller.dob =
                                DateFormat('dd/MM/yyyy').format(picked);
                            dobEditingController.text =
                                DateFormat('dd/MM/yyyy').format(picked);
                            _controller.isDobValid = true;
                          }
                          _controller.enableNextButton();
                          _controller.update();
                        },
                        fillColor: Colors.white.withOpacity(.8),
                        contentPadding: Dimens.edgeInsets16,
                        textInputType: TextInputType.text,
                        errorText: _controller.dobErrorText,
                        hintText: _controller.dob.isEmpty ? 'DD/MM/YYYY' : null,
                        hintStyle: Styles.lightGrey16,
                      ),
                      // Dimens.boxHeight20,
                      // Text(
                      //   StringConstants.haveReferralCode,
                      //   style: Styles.lightGrey14,
                      // ),
                      // Dimens.boxHeight10,
                      // FormFieldWidget(
                      //   fillColor: Colors.white.withOpacity(.8),
                      //   contentPadding: Dimens.edgeInsets16,
                      //   textInputType: TextInputType.text,
                      //   // hintText: StringConstants.enterReferralCode,
                      //   // hintStyle: Styles.lightGrey16,
                      // ),
                      Dimens.boxHeight20,
                      FormSubmitWidget(
                        text: StringConstants.next,
                        textStyle: Styles.whiteLight16,
                        padding: Dimens.edgeInsets10_0_10_0,
                        buttonColor: _controller.isNextButtonEnable
                            ? AppColors.primaryColor
                            : AppColors.buttonDisableColor,
                        onTap: _controller.isNextButtonEnable
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
