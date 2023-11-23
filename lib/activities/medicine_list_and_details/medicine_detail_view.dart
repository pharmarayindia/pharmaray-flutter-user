import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:readmore/readmore.dart';

class MedicineDetailView extends StatefulWidget {
  @override
  State<MedicineDetailView> createState() => _MedicineDetailViewState();
}

class _MedicineDetailViewState extends State<MedicineDetailView> {
  var args = Get.arguments as String? ?? '';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeController>(
          builder: (_controller) => SizedBox(
            width: Dimens.percentWidth(1),
            height: Dimens.percentHeight(1),
            child:  Obx(() =>  ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: Dimens.edgeInsets20_10_20_0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: Get.back,
                            child: SizedBox(
                              width: Dimens.fifteen,
                              height: Dimens.fifteen,
                              child: Image.asset(
                                AssetConstants.backArrow,
                                width: Dimens.fifteen,
                                height: Dimens.fifteen,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (_controller.cartResponse != null &&
                            _controller.cartResponse?.data != null &&
                            _controller.cartResponse!.data!.isNotEmpty)
                            ? () async {
                          var list = <dynamic>[];
                          for (var i = 0;
                          i < _controller.cartResponse!.data!.length;
                          i++) {
                            list.add({
                              'productId': num.parse(
                                  '${_controller.cartResponse?.data?[i].productId}'),
                              'quantity': num.parse(
                                  '${_controller.cartResponse?.data?[i].quantity}')
                            });
                          }
                          await _controller.getCartTotals(
                              loading: true,
                              couponCode: null,
                              list: list);
                          RouteManagement.goToCartAndCheckout();
                        }
                            : RouteManagement.goToCartAndCheckout,
                        child: SizedBox(
                          width: Dimens.thirtyFive,
                          height: Dimens.thirtyFive,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AssetConstants.cartIcon,
                                  width: Dimens.eighteen,
                                  height: Dimens.eighteen,
                                ),
                              ),
                              (_controller.cartResponse != null &&
                                  _controller.cartResponse?.data != null &&
                                  _controller
                                      .cartResponse!.data!.isNotEmpty)
                                  ? Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: Dimens.eight,
                                  backgroundColor: Colors.red,
                                  child: Center(
                                    child: Text(
                                      '${_controller.cartResponse?.data?.length}',
                                      style: Styles.white12,
                                    ),
                                  ),
                                ),
                              )
                                  : Dimens.box0,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Dimens.boxHeight20,
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Dimens.percentWidth(.7),
                        child: Text(
                          '${_controller.productDetailsResponse?.data?[0].productName}',
                          style: Styles.black20w700,
                        ),
                      ),
                      SizedBox(
                        width: Dimens.percentWidth(1),
                        height: Dimens.percentHeight(.2),
                        child: PageView.builder(
                          controller: _controller.controller,
                          itemCount: 5,
                          itemBuilder: (context, index) => SizedBox(
                            width: Dimens.percentWidth(.7),
                            height: Dimens.percentHeight(.3),
                            child: (_controller.cartResponse?.data?[index].medicine_image ?? "").isEmpty || (_controller.cartResponse?.data?[index].medicine_image == null) ? Image.asset(AssetConstants.dummy3) : Image.network('${_controller.cartResponse?.data?[index].medicine_image}'),
                          ),
                          onPageChanged: (value) {
                            _controller.currentItemPage = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DotsIndicator(
                            decorator: DotsDecorator(
                              activeColor: AppColors.blackColor,
                              size: Size(Dimens.five, Dimens.five),
                              activeSize: Size(Dimens.five, Dimens.five),
                            ),
                            dotsCount: 5,
                            position: _controller.currentItemPage.toInt(),
                          ),
                        ],
                      ),
                      Dimens.boxHeight10,
                      Text(
                        '${_controller.productDetailsResponse?.data?[0].productOtherName}',
                        style: Styles.grey14Medium,
                      ),
                      Dimens.boxHeight5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${_controller.productDetailsResponse?.data?[0].listedPrice}',
                            style: Styles.boldBlack16W700,
                          ),
                          Container(
                            width: Dimens.percentWidth(.5),
                            height: Dimens.thirtyFive,
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: AppColors.lightGreyColor),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            child: Padding(
                              padding: Dimens.edgeInsets20_0_20_0,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap:
                                    '${_controller.productDetailsResponse?.data?[0].cartQuantity}' !=
                                        '0'
                                        ? () async {
                                      var res = await _controller
                                          .updateItemInCart(
                                          productId: '$args',
                                          cartQuantity:
                                          _controller.productDetailsResponse?.data?[0].cartQuantity ?? 0,
                                          isAddition: false);
                                      if (res == true) {
                                        await _controller
                                            .getStorePageList(
                                            searchText: '',
                                            isLoading: true,
                                            skip: _controller
                                                .storeSkip,
                                            limit: _controller
                                                .storeLimit);
                                        await _controller
                                            .productDetail(
                                            productId: args);
                                        await _controller
                                            .getCartItems(
                                            isLoading: true);
                                        _controller.update();
                                      }
                                    }
                                        : null,
                                    child: SizedBox(
                                      width: Dimens.fifteen,
                                      height: Dimens.fifteen,
                                      child: Image.asset(
                                        AssetConstants.minus,
                                        width: Dimens.twelve,
                                        height: Dimens.twelve,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${_controller.productDetailsResponse?.data?[0].cartQuantity}',
                                    style: Styles.primary18Bold,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var res = await _controller.updateItemInCart(
                                          productId: '$args',
                                          cartQuantity:
                                          _controller.productDetailsResponse?.data?[0].cartQuantity ?? 0,
                                          isAddition: true);
                                      if (res == true) {
                                        await _controller.getStorePageList(
                                            searchText: '',
                                            isLoading: true,
                                            skip: _controller.storeSkip,
                                            limit: _controller.storeLimit);
                                        await _controller.productDetail(
                                            productId: args);
                                        await _controller.getCartItems(
                                            isLoading: true);
                                        _controller.update();
                                      }
                                    },
                                    child: Image.asset(
                                      AssetConstants.add,
                                      width: Dimens.twelve,
                                      height: Dimens.twelve,
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
                ),
                Dimens.boxHeight5,
                '${_controller.productDetailsResponse?.data?[0].cartQuantity}' ==
                    '0'
                    ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: Dimens.percentWidth(.55),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.red,
                                size: Dimens.fifteen,
                              ),
                              Dimens.boxWidth5,
                              Text(
                                StringConstants.selectQuantity,
                                style: Styles.lightRed12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
                    : Dimens.box0,
                Dimens.boxHeight10,
                Divider(
                  thickness: 1,
                  height: Dimens.two,
                  color: AppColors.lightGreyColor,
                ),
                // Dimens.boxHeight5,
                // Padding(
                //   padding: Dimens.edgeInsets20_0_20_0,
                //   child: Text(
                //     StringConstants.additionalOffers,
                //     style: Styles.boldBlack12,
                //   ),
                // ),
                // Dimens.boxHeight5,
                // Container(
                //   width: Dimens.percentWidth(1),
                //   decoration: BoxDecoration(
                //       border: Border.all(color: AppColors.storeColor1),
                //       color: AppColors.medicineDetailContainerColor),
                //   child: Padding(
                //     padding: Dimens.edgeInsets20,
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         SizedBox(
                //           width: Dimens.fifteen,
                //           child: Image.asset(AssetConstants.wallet),
                //         ),
                //         Dimens.boxWidth5,
                //         SizedBox(
                //           width: Dimens.percentWidth(.8),
                //           child: Text(
                //             'Paytm Wallet: Pay using Paytm and get upto ₹300 instant cashback on orders above ₹500 and more. Offer valid until 31st July 2022',
                //             style: Styles.boldBlack12,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Dimens.boxHeight10,
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.productDetails,
                        style: Styles.boldBlack12,
                      ),
                      ReadMoreText(
                        'Crocin is a general pain reliever, taken as tablet on medical prescription by the physician or medical consultant\n\n Crocin has been shown to be an antioxidant and neural protective agent. The antioxidant behavior of crocin is related to the sugar moiety in crocin molecule which has a vital role in its chemical reactivity.[6] It has also been shown to have an antiproliferative action against cancer cells in vitro.Limited evidence suggests possible antidepressant. Crocin is a general pain reliever, taken as tablet on medical prescription by the physician or medical consultant\n\n Crocin has been shown to be an antioxidant and neural protective agent. The antioxidant behavior of crocin is related to the sugar moiety in crocin molecule which has a vital role in its chemical reactivity.[6] It has also been shown to have an antiproliferative action against cancer cells in vitro.Limited evidence suggests possible antidepressant \n\n',
                        trimLines: 3,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: StringConstants.readMore,
                        trimExpandedText: StringConstants.readLess,
                        moreStyle: Styles.primary14BoldDarkColor,
                        lessStyle: Styles.primary14BoldDarkColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: Dimens.edgeInsets20,
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
                '${_controller.productDetailsResponse?.data?[0].cartQuantity}' !=
                    '0'
                    ? Padding(
                  padding: Dimens.edgeInsets20,
                  child: InkWell(
                    onTap: () async {
                      var list = <dynamic>[];
                      for (var i = 0;
                      i < _controller.cartResponse!.data!.length;
                      i++) {
                        list.add({
                          'productId': num.parse(
                              '${_controller.cartResponse?.data?[i].productId}'),
                          'quantity': num.parse(
                              '${_controller.cartResponse?.data?[i].quantity}')
                        });
                      }
                      await _controller.getCartTotals(
                          loading: true, couponCode: null, list: list);
                      RouteManagement.goToCartAndCheckout();
                    },
                    child: Container(
                      width: Dimens.percentWidth(1),
                      height: Dimens.fifty,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        color: AppColors.primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetConstants.cartIcon,
                            color: Colors.white,
                            width: Dimens.twenty,
                            height: Dimens.twenty,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            '${StringConstants.goToCart} (${_controller.cartResponse?.data?.length})',
                            style: Styles.whiteLight14,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : Dimens.box0,
              ],
            ),)

          ),
        ),
      );
}
