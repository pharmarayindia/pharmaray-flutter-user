import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class CartAndCheckoutView extends StatefulWidget {
  @override
  State<CartAndCheckoutView> createState() => _CartAndCheckoutViewState();
}

class _CartAndCheckoutViewState extends State<CartAndCheckoutView> {
  var textEditingController = TextEditingController();
  bool isCouponValid = true;

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: CustomAppBar(
          title: StringConstants.cart,
        ),
        preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (homeController.cartResponse != null &&
                    homeController.cartResponse?.data != null &&
                    homeController.cartResponse!.data!.isNotEmpty)
                ? ListView.builder(
                    padding: Dimens.edgeInsets10_0_10_0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.cartResponse?.data?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: Dimens.edgeInsets0_10_0_0,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: Dimens.eightyFive,
                                  height: Dimens.eightyFive,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.lightGreyColor),
                                    borderRadius:
                                        BorderRadius.circular(Dimens.five),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Dimens.ten),
                                        ),
                                        child: Center(
                                          child: SizedBox(
                                            width: Dimens.oneHundredTwenty,
                                            height: Dimens.oneHundredTwenty,
                                            child: Image.network('${homeController.cartResponse?.data?[index].medicine_image}'
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxWidth5,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            '₹${homeController.cartResponse?.data?[index].listedPrice?.toStringAsFixed(2)}',
                                            style: Styles.boldBlack14w700,
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
                                    Container(
                                      width: Dimens.percentWidth(.2),
                                      height: Dimens.twentyFive,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(Dimens.five),
                                      ),
                                      child: Padding(
                                        padding: Dimens.edgeInsets5_0_5_0,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                await homeController.updateItemInCart(
                                                    productId:
                                                        '${homeController.cartResponse?.data?[index].productId}',
                                                    cartQuantity:
                                                        homeController.cartResponse?.data![index].quantity ?? 0,
                                                    isAddition: false);
                                                await homeController
                                                    .getCartItems(
                                                        isLoading: true);
                                                var list = <dynamic>[];
                                                for (var i = 0;
                                                    i <
                                                        homeController
                                                            .cartResponse!
                                                            .data!
                                                            .length;
                                                    i++) {
                                                  list.add({
                                                    'productId':
                                                        '${homeController.cartResponse?.data?[i].productId}',
                                                    'quantity': num.parse(
                                                        '${homeController.cartResponse?.data?[i].quantity}')
                                                  });
                                                }
                                                await homeController
                                                    .getCartTotals(
                                                        loading: true,
                                                        couponCode: null,
                                                        list: list);
                                                setState(() {});
                                              },
                                              child: SizedBox(
                                                width: Dimens.fifteen,
                                                height: Dimens.fifteen,
                                                child: Image.asset(
                                                  AssetConstants.minus,
                                                  width: Dimens.fifteen,
                                                  color:
                                                      '${homeController.cartResponse?.data?[index].quantity}' ==
                                                              '0'
                                                          ? Colors.grey
                                                          : Colors.black,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '${homeController.cartResponse?.data?[index].quantity}',
                                              style: Styles.primary18Bold,
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () async {
                                                await homeController.updateItemInCart(
                                                    productId:
                                                        '${homeController.cartResponse?.data?[index].productId}',
                                                    cartQuantity:
                                                        homeController.cartResponse?.data?[index].quantity ?? 0,
                                                    isAddition: true);
                                                await homeController
                                                    .getCartItems(
                                                        isLoading: true);
                                                var list = <dynamic>[];
                                                for (var i = 0;
                                                    i <
                                                        homeController
                                                            .cartResponse!
                                                            .data!
                                                            .length;
                                                    i++) {
                                                  list.add({
                                                    'productId':
                                                        '${homeController.cartResponse?.data?[i].productId}',
                                                    'quantity': homeController.cartResponse?.data?[i].quantity
                                                  });
                                                }
                                                await homeController
                                                    .getCartTotals(
                                                        loading: true,
                                                        couponCode: null,
                                                        list: list);
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                AssetConstants.add,
                                                width: Dimens.fifteen,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                await homeController.updateItemInCart(
                                    productId:
                                        '${homeController.cartResponse?.data?[index].productId}',
                                    cartQuantity: 1,
                                    isAddition: false);
                                await homeController.getCartItems(
                                    isLoading: true);
                                var list = <dynamic>[];
                                for (var i = 0;
                                    i <
                                        homeController
                                            .cartResponse!.data!.length;
                                    i++) {
                                  list.add({
                                    'productId':
                                        '${homeController.cartResponse?.data?[i].productId}',
                                    'quantity': num.parse(
                                        '${homeController.cartResponse?.data?[i].quantity}')
                                  });
                                }
                                await homeController.getCartTotals(
                                    loading: true,
                                    couponCode: null,
                                    list: list);
                                setState(() {});
                              },
                              child: Image.asset(
                                AssetConstants.delete,
                                width: Dimens.fifteen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Dimens.box0,
            (homeController.cartResponse != null &&
                    homeController.cartResponse?.data != null &&
                    homeController.cartResponse!.data!.isNotEmpty)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight15,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          children: [
                            Image.asset(
                              AssetConstants.coupon,
                              width: Dimens.twenty,
                              height: Dimens.twenty,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              StringConstants.coupon,
                              style: Styles.boldBlack16W700,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: DottedBorder(
                          color: isCouponValid
                              ? AppColors.dottedBorderColor
                              : Colors.red,
                          dashPattern: [5, 5],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(Dimens.eight),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Dimens.percentWidth(.65),
                                height: Dimens.fifty,
                                child: FormFieldWidget(
                                  // hintText: StringConstants.enterPromoCode,
                                  contentPadding: Dimens.edgeInsets16,
                                  hintStyle: Styles.lightGrey16,
                                  textEditingController: textEditingController,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () async {
                                  var list = <dynamic>[];
                                  for (var i = 0;
                                      i <
                                          homeController
                                              .cartResponse!.data!.length;
                                      i++) {
                                    list.add({
                                      'productId':
                                          '${homeController.cartResponse?.data?[i].productId}',
                                      'quantity': num.parse(
                                          '${homeController.cartResponse?.data?[i].quantity}')
                                    });
                                  }
                                  var res = await homeController.getCartTotals(
                                      loading: true,
                                      couponCode: textEditingController.text,
                                      list: list);
                                  if (res == true) {
                                    isCouponValid = true;
                                  } else {
                                    isCouponValid = false;
                                  }
                                  homeController.update();
                                  setState(() {});
                                },
                                child: Container(
                                  width: Dimens.hundred,
                                  height: Dimens.fifty,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(Dimens.eight),
                                      bottomLeft: Radius.circular(Dimens.eight),
                                    ),
                                    color: AppColors.applyColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      StringConstants.apply,
                                      style: Styles.boldBlack16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      isCouponValid
                          ? Dimens.box0
                          : Padding(
                              padding: Dimens.edgeInsets10,
                              child: Text(
                                StringConstants.couponCodeInvalid,
                                style: Styles.lightRed12,
                              ),
                            ),
                      Dimens.boxHeight30,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          children: [
                            Text(
                              StringConstants.priceDetails,
                              style: Styles.boldBlack16W700,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.totalMRP,
                              style: Styles.black14,
                            ),
                            Text(
                              '₹${(homeController.cartTotalResponse?.data?.subTotal)?.toStringAsFixed(2)}',
                              style: Styles.black14,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.discountOnMRP,
                              style: Styles.black14,
                            ),
                            Text(
                              '₹${homeController.cartTotalResponse?.data?.discountTotal}',
                              style: Styles.black14,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.couponDiscount,
                              style: Styles.black14,
                            ),
                            Text(
                              '₹${homeController.cartTotalResponse?.data?.discountTotal}',
                              style: Styles.black14,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.deliveryCharges,
                              style: Styles.black14,
                            ),
                            Text(
                              '₹${homeController.cartTotalResponse?.data?.shippingCharges}' ==
                                      '0'
                                  ? 'FREE'
                                  : '₹${homeController.cartTotalResponse?.data?.shippingCharges}',
                              style: Styles.black14,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: const Divider(),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.totalAmount,
                              style: Styles.boldBlack16W700,
                            ),
                            Text(
                              '₹${homeController.cartTotalResponse?.data?.grandTotal?.toStringAsFixed(2)}',
                              style: Styles.boldBlack16W700,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Text(
                          'Prices shown above are an estimate the actual prices will be notified once your order is ready for dispatch',
                          style: Styles.black12,
                        ),
                      ),
                      Dimens.boxHeight30,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: FormSubmitWidget(
                          text: StringConstants.continue1,
                          textStyle: Styles.whiteLight16,
                          padding: Dimens.edgeInsets10_0_10_0,
                          buttonColor: AppColors.primaryColor,
                          onTap: () {
                            Get.bottomSheet<dynamic>(
                              Container(
                                width: Dimens.percentWidth(1),
                                height: Dimens.percentHeight(.4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      Dimens.ten,
                                    ),
                                    topRight: Radius.circular(
                                      Dimens.ten,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: Dimens.edgeInsets20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AssetConstants.chooseMode,
                                            width: Dimens.ninetyFive,
                                            height: Dimens.sixty,
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        StringConstants.chooseMode,
                                        style: Styles.boldBlack16,
                                      ),
                                      Text(
                                        StringConstants.addressNotChange,
                                        style: Styles.lightGrey14,
                                      ),
                                      Dimens.boxHeight20,
                                      InkWell(
                                        onTap: () {
                                          Get.back<dynamic>();
                                          if (homeController
                                                      .addressesResponse !=
                                                  null &&
                                              homeController.addressesResponse
                                                      ?.data !=
                                                  null &&
                                              homeController.addressesResponse!
                                                  .data!.isNotEmpty) {
                                            RouteManagement.goToSavedAddresses(
                                                couponCode: isCouponValid
                                                    ? textEditingController.text
                                                    : '');
                                          } else {
                                            RouteManagement.goToAddAddress(
                                              isFromCart: true,
                                            );
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetConstants.homeDelivery,
                                              width: Dimens.twenty,
                                              height: Dimens.twenty,
                                            ),
                                            Dimens.boxWidth10,
                                            Text(
                                              StringConstants.getHomeDelivered,
                                              style: Styles.boldBlack14,
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: AppColors.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Dimens.boxHeight10,
                                      const Divider(),
                                      Dimens.boxHeight10,
                                      InkWell(
                                        onTap: () {
                                          Get.back<dynamic>();
                                          RouteManagement.goToPickUpAddressMapView(
                                              title: 'Labdhi Medical',
                                              subTitle:
                                                  '2/27 -B Viranager Socitey, Bhimjipura, Nava Vadaj, Ahmedabad',
                                              couponCode: isCouponValid
                                                  ? textEditingController.text
                                                  : '');
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetConstants.inStorePickUp,
                                              width: Dimens.twenty,
                                              height: Dimens.twenty,
                                            ),
                                            Dimens.boxWidth10,
                                            Text(
                                              StringConstants.pickUpOrder,
                                              style: Styles.boldBlack14,
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: AppColors.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              isScrollControlled: true,
                            );
                          },
                        ),
                      ),
                      Dimens.boxHeight15,
                      Padding(
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.genuineProducts,
                                  width: Dimens.twenty,
                                  height: Dimens.twenty,
                                ),
                                Dimens.boxHeight5,
                                Text(
                                  StringConstants.genuineProducts,
                                  style: Styles.grey12,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.service,
                                  width: Dimens.twenty,
                                  height: Dimens.twenty,
                                ),
                                Dimens.boxHeight5,
                                Text(
                                  StringConstants.service,
                                  style: Styles.grey12,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.quickDelivery,
                                  width: Dimens.twenty,
                                  height: Dimens.twenty,
                                ),
                                Dimens.boxHeight5,
                                Text(
                                  StringConstants.quickDelivery,
                                  style: Styles.grey12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight20,
                    ],
                  )
                : SizedBox(
                    width: Dimens.percentWidth(1),
                    height: Dimens.percentHeight(.9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetConstants.nothing,
                          width: Dimens.hundred,
                          height: Dimens.hundred,
                        ),
                        Text(
                          StringConstants.nothingToShow,
                          style: Styles.lightGrey16,
                        ),
                      ],
                    ),
                  ),
            Dimens.boxHeight20,
          ],
        ),
      ),
    );
  }
}
