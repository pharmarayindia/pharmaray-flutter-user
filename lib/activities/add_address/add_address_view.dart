import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class AddAddressView extends StatefulWidget {
  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  var args1 = Get.arguments as bool? ?? false;
  final fullNameEditingController = TextEditingController();
  final contactEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final landmarkEditingController = TextEditingController();
  bool isDefault = false;
  var homeController = Get.find<HomeController>();

  @override
  void initState() {
    fullNameEditingController.text =
        '${homeController.profileResponse?.data?.fullName}';
    contactEditingController.text =
        '${homeController.profileResponse?.data?.mobile}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets10,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: Dimens.edgeInsets0,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back<dynamic>();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.greyColor,
                              ),
                            ),
                            Text(
                              StringConstants.addNewAddress,
                              style: Styles.regularBlack20,
                            ),
                          ],
                        ),
                        Dimens.boxHeight20,
                        Text(
                          StringConstants.contactDetails,
                          style: Styles.lightGrey16,
                        ),
                        Dimens.boxHeight16,
                        Text(
                          StringConstants.fullName,
                          style: Styles.grey12Regular,
                        ),
                        Dimens.boxHeight5,
                        FormFieldWidget(
                          fillColor: AppColors.formFieldColor,
                          contentPadding: Dimens.edgeInsets16,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          textInputType: TextInputType.text,
                          textEditingController: fullNameEditingController,
                        ),
                        Dimens.boxHeight10,
                        Text(
                          StringConstants.contactNumber,
                          style: Styles.grey12Regular,
                        ),
                        Dimens.boxHeight5,
                        FormFieldWidget(
                          fillColor: AppColors.formFieldColor,
                          contentPadding: Dimens.edgeInsets16,
                          textInputType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          textEditingController: contactEditingController,
                        ),
                        Dimens.boxHeight30,
                        Text(
                          StringConstants.address,
                          style: Styles.lightGrey16,
                        ),
                        Dimens.boxHeight16,
                        Text(
                          StringConstants.addressType,
                          style: Styles.grey12Regular,
                        ),
                        Dimens.boxHeight5,
                        Container(
                          width: Dimens.percentWidth(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.ten),
                              ),
                              color: AppColors.formFieldColor),
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
                              value: _controller.selectedAddressType,
                              items: _controller.addressItemsToShow,
                              hint: Padding(
                                padding: Dimens.edgeInsets16_0_0_0,
                                child: Text(
                                  StringConstants.select,
                                  style: Styles.lightGrey16,
                                ),
                              ),
                              onChanged: (dynamic value) {
                                _controller.selectedAddressType =
                                    value as SelectedAddressType;
                                _controller.update();
                              },
                            ),
                          ),
                        ),
                        Dimens.boxHeight10,
                        Text(
                          StringConstants.building,
                          style: Styles.grey12Regular,
                        ),
                        Dimens.boxHeight5,
                        FormFieldWidget(
                          fillColor: AppColors.formFieldColor,
                          contentPadding: Dimens.edgeInsets16,
                          textInputType: TextInputType.text,
                          textEditingController: addressEditingController,
                        ),
                        Dimens.boxHeight10,
                        Text(
                          StringConstants.landmark,
                          style: Styles.grey12Regular,
                        ),
                        Dimens.boxHeight5,
                        FormFieldWidget(
                          fillColor: AppColors.formFieldColor,
                          contentPadding: Dimens.edgeInsets16,
                          textInputType: TextInputType.text,
                          textEditingController: landmarkEditingController,
                        ),
                        Dimens.boxHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants.city,
                                  style: Styles.grey12Regular,
                                ),
                                Dimens.boxHeight5,
                                Container(
                                  width: Dimens.percentWidth(.45),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens.ten),
                                      ),
                                      color: AppColors.formFieldColor),
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
                                          StringConstants.selectCity,
                                          style: Styles.lightGrey16,
                                        ),
                                      ),
                                      onChanged: (dynamic value) {
                                        _controller.selectedCity =
                                            value as CitiesData;
                                        _controller.getAreas();
                                        _controller.update();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants.area,
                                  style: Styles.grey12Regular,
                                ),
                                Dimens.boxHeight5,
                                Container(
                                  width: Dimens.percentWidth(.45),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens.ten),
                                      ),
                                      color: AppColors.formFieldColor),
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
                                          StringConstants.selectArea,
                                          style: Styles.lightGrey16,
                                        ),
                                      ),
                                      onChanged: (dynamic value) {
                                        _controller.selectedArea =
                                            value as CitiesData;
                                        _controller.update();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Dimens.boxHeight30,
                        Row(
                          children: [
                            SizedBox(
                              width: Dimens.twentyFour,
                              height: Dimens.twentyFour,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.five),
                                ),
                                value: isDefault,
                                activeColor: AppColors.primaryColor,
                                onChanged: (value) {
                                  isDefault = value as bool;
                                  _controller.update();
                                },
                              ),
                            ),
                            Dimens.boxWidth5,
                            Text(
                              StringConstants.setThisAsMyDefaultAddress,
                              style: Styles.lightGrey14,
                            ),
                          ],
                        ),
                        Dimens.boxHeight20,
                        FormSubmitWidget(
                          text: args1
                              ? StringConstants.proceedToCheckout
                              : StringConstants.saveAddress,
                          textStyle: Styles.whiteLight16,
                          padding: Dimens.edgeInsets10_0_10_0,
                          buttonColor: (fullNameEditingController
                                      .text.isNotEmpty &&
                                  contactEditingController.text.isNotEmpty &&
                                  _controller.selectedAddressType != null &&
                                  addressEditingController.text.isNotEmpty &&
                                  _controller.selectedCity != null &&
                                  _controller.selectedArea != null)
                              ? AppColors.primaryColor
                              : AppColors.buttonDisableColor,
                          onTap: (fullNameEditingController.text.isNotEmpty &&
                                  contactEditingController.text.isNotEmpty &&
                                  _controller.selectedAddressType != null &&
                                  addressEditingController.text.isNotEmpty &&
                                  _controller.selectedCity != null &&
                                  _controller.selectedArea != null)
                              ? () {
                                  _controller.updateAddress(
                                      type:
                                          '${_controller.selectedAddressType?.data}',
                                      fullName: fullNameEditingController.text,
                                      contactNumber: contactEditingController
                                          .text,
                                      line1: addressEditingController.text,
                                      line2: addressEditingController.text,
                                      landmark: landmarkEditingController.text,
                                      city: '${_controller.selectedCity?.name}',
                                      area: '${_controller.selectedArea?.name}',
                                      state: 'Gujarat',
                                      country: 'India',
                                      pinCode: 'string',
                                      isDefault:
                                          (_controller.addressesResponse ==
                                                      null ||
                                                  _controller.addressesResponse!
                                                          .data ==
                                                      null ||
                                                  _controller.addressesResponse!
                                                      .data!.isEmpty)
                                              ? true
                                              : isDefault,
                                      isLoading: true);
                                }
                              : null,
                        ),
                        Dimens.boxHeight20,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
