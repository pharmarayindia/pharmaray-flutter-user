import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class SavedAddresses extends StatefulWidget {
  const SavedAddresses({Key? key}) : super(key: key);

  @override
  State<SavedAddresses> createState() => _SavedAddressesState();
}

class _SavedAddressesState extends State<SavedAddresses> {
  var homeController = Get.find<HomeController>();
  var args = Get.arguments as String? ?? '';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.checkout,
          ),
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
        ),
        body: GetBuilder<HomeController>(
          builder: (_controller) => SizedBox(
            width: Dimens.percentWidth(1),
            height: Dimens.percentHeight(1),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: GestureDetector(
                    onTap: () {
                      Get.bottomSheet<dynamic>(
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimens.twenty),
                                topRight: Radius.circular(Dimens.twenty),
                              ),
                              color: Colors.white),
                          child: ListView.builder(
                            padding: Dimens.edgeInsets20,
                            shrinkWrap: true,
                            itemCount:
                                homeController.cartResponse?.data?.length,
                            itemBuilder: (context, index) => Padding(
                              padding: Dimens.edgeInsets0_10_0_0,
                              child: Container(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: Dimens.eightyFive,
                                          height: Dimens.eightyFive,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    AppColors.lightGreyColor),
                                            borderRadius: BorderRadius.circular(
                                                Dimens.five),
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimens.ten),
                                                ),
                                                child: Center(
                                                  child: SizedBox(
                                                    width:
                                                        Dimens.oneHundredTwenty,
                                                    height:
                                                        Dimens.oneHundredTwenty,
                                                    child: Image.asset(
                                                        AssetConstants.dummy4),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Dimens.boxWidth5,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Dimens.percentWidth(.6),
                                              child: Text(
                                                '${homeController.cartResponse?.data?[index].productName}',
                                                style: Styles.boldBlack14w700,
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                            SizedBox(
                                              width: Dimens.percentWidth(.65),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '₹${homeController.cartResponse?.data?[index].listedPrice}',
                                                    style:
                                                        Styles.boldBlack14w700,
                                                  ),
                                                  // Dimens.boxWidth20,
                                                  // (homeController
                                                  //                 .cartResponse
                                                  //                 ?.data?[index]
                                                  //                 .listedPrice ==
                                                  //             homeController
                                                  //                 .cartResponse
                                                  //                 ?.data?[index]
                                                  //                 .discountedPrice ||
                                                  //         homeController
                                                  //                 .cartResponse
                                                  //                 ?.data?[index]
                                                  //                 .listedPrice ==
                                                  //             0)
                                                  //     ? Dimens.box0
                                                  //     : Text(
                                                  //         '₹${homeController.cartResponse?.data?[index].listedPrice}',
                                                  //         style: Styles
                                                  //             .grey11RegularStriked,
                                                  //       ),
                                                ],
                                              ),
                                            ),
                                            Dimens.boxHeight15,
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: Dimens.fifty,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                        border: Border.all(
                          color: AppColors.searchFieldOuterColor,
                        ),
                        color: AppColors.searchFieldInnerColor,
                      ),
                      child: Padding(
                        padding: Dimens.edgeInsets10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.viewCart,
                              style: Styles.grey14Regular,
                            ),
                            Image.asset(
                              AssetConstants.dropDown,
                              color: AppColors.greyLight,
                              width: Dimens.twenty,
                              height: Dimens.twenty,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: Text(
                    StringConstants.deliverTo,
                    style: Styles.grey14Regular,
                  ),
                ),
                SizedBox(
                  width: Dimens.percentWidth(1),
                  height: Dimens.percentHeight(.65),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.addressesResponse?.data?.length,
                    padding: Dimens.edgeInsets20,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Dimens.twentyFour,
                                height: Dimens.twentyFour,
                                child: Radio(
                                  activeColor: AppColors.primaryColor,
                                  value: index,
                                  groupValue: homeController.selectedAddress,
                                  onChanged: (value) {
                                    homeController.selectedAddress = index;
                                    homeController.update();
                                    _controller.update();
                                  },
                                ),
                              ),
                              Dimens.boxWidth10,
                              Text(
                                '${homeController.addressesResponse?.data?[index].fullName}',
                                style: Styles.boldBlack18,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Dimens.twentyFour,
                              ),
                              Dimens.boxWidth10,
                              SizedBox(
                                width: Dimens.percentWidth(.7),
                                child: Text(
                                  '${homeController.addressesResponse?.data?[index].line1} ${homeController.addressesResponse?.data?[index].landmark} ${homeController.addressesResponse?.data?[index].city} ${homeController.addressesResponse?.data?[index].state}',
                                  style: Styles.lightGrey14,
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxHeight30,
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    RouteManagement.goToAddAddress(isFromCart: false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetConstants.add,
                        color: AppColors.primaryColor,
                        width: Dimens.fifteen,
                        height: Dimens.fifteen,
                      ),
                      Dimens.boxWidth10,
                      Text(
                        StringConstants.addNewAddress,
                        style: Styles.primary14Bold,
                      ),
                    ],
                  ),
                ),
                Dimens.boxHeight20,
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: InkWell(
                    onTap: () async {
                      var list = <dynamic>[];
                      for (var i = 0;
                          i < homeController.cartResponse!.data!.length;
                          i++) {
                        list.add({
                          'productId':
                              '${homeController.cartResponse?.data?[i].productId}',
                          'quantity': num.parse(
                              '${homeController.cartResponse?.data?[i].quantity}')
                        });
                      }
                      var res = await homeController.createOrder(
                          loading: true,
                          cartItems: list,
                          orderPlacedType: 'Home',
                          userAddressId: int.parse(
                              '${homeController.addressesResponse?.data?[homeController.selectedAddress].id}'),
                          couponCode: (args.isEmpty) ? null : args);
                      if (res == true) {
                        RouteManagement.goToSelectPaymentMethod();
                      }
                    },
                    child: Container(
                      width: Dimens.percentWidth(1),
                      height: Dimens.fifty,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          StringConstants.proceedToPayment,
                          style: Styles.whiteLight14,
                        ),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
              ],
            ),
          ),
        ),
      );
}
