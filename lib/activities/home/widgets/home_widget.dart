import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:shimmer/shimmer.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => SizedBox(
          width: Dimens.percentWidth(1),
          height: Dimens.percentHeight(1),
          child: SafeArea(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: Dimens.edgeInsets20_10_20_0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetConstants.locationIcon,
                            width: Dimens.twenty,
                            height: Dimens.twenty,
                          ),
                          Dimens.boxWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet<dynamic>(AddressBookWidget(),
                                      isScrollControlled: false);
                                },
                                child: Row(
                                  children: [
                                    (_controller.addressesResponse != null &&
                                            _controller
                                                    .addressesResponse!.data !=
                                                null &&
                                            _controller.addressesResponse!.data!
                                                .isNotEmpty)
                                        ? _controller.selectedAddress != -1
                                            ? Text(
                                                '${_controller.addressesResponse?.data?[_controller.selectedAddress].city}',
                                                style: Styles.boldBlack16W700,
                                              )
                                            : Text(
                                                'Add Address',
                                                style: Styles.boldBlack16W700,
                                              )
                                        : Text(
                                            'Add Address',
                                            style: Styles.boldBlack16W700,
                                          ),
                                    Dimens.boxWidth10,
                                    const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              (_controller.addressesResponse != null &&
                                      _controller.addressesResponse!.data !=
                                          null &&
                                      _controller
                                          .addressesResponse!.data!.isNotEmpty)
                                  ? _controller.selectedAddress != -1
                                      ? Text(
                                          '${_controller.addressesResponse?.data?[_controller.selectedAddress].landmark} ${_controller.addressesResponse?.data?[_controller.selectedAddress].area}',
                                          style: Styles.grey10Regular,
                                        )
                                      : Text(
                                          'Enter your address',
                                          style: Styles.grey10Regular,
                                        )
                                  : Text(
                                      'Enter your address',
                                      style: Styles.grey10Regular,
                                    )
                            ],
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
                  child: GestureDetector(
                    onTap: () {
                      _controller.searchMedicineResponse = null;
                      RouteManagement.goToSearchMedicines();
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
                          children: [
                            const Icon(
                              Icons.search,
                              color: AppColors.greyLight,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              StringConstants.searchMedicines,
                              style: Styles.grey14Regular,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight16,
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _controller.selectedIndex = 2;
                          _controller.update();
                        },
                        child: Container(
                          height: Dimens.ninety,
                          width: Dimens.percentWidth(.43),
                          decoration: BoxDecoration(
                            color: AppColors.storeColor,
                            borderRadius: BorderRadius.circular(
                              Dimens.eight,
                            ),
                          ),
                          child: Padding(
                            padding: Dimens.edgeInsets10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AssetConstants.store,
                                  width: Dimens.fourty,
                                  height: Dimens.fourty,
                                ),
                                Text(
                                  StringConstants.store,
                                  style: Styles.darkGreen16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to<dynamic>(HowToAdd.new);
                        },
                        child: Container(
                          height: Dimens.ninety,
                          width: Dimens.percentWidth(.43),
                          decoration: BoxDecoration(
                            color: AppColors.pathologyColor,
                            borderRadius: BorderRadius.circular(
                              Dimens.eight,
                            ),
                          ),
                          child: Padding(
                            padding: Dimens.edgeInsets10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AssetConstants.pathology,
                                  width: Dimens.fourty,
                                  height: Dimens.fourty,
                                ),
                                Text(
                                  StringConstants.pathologyTests,
                                  style: Styles.darkBlue16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Dimens.boxHeight16,
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: Container(
                    height: Dimens.eighty,
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
                          SizedBox(
                            width: Dimens.percentWidth(.52),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants
                                      .orderViaPrescriptionWithoutExclamation,
                                  style: Styles.primary18Bold,
                                ),
                                Text(
                                  StringConstants.uploadPrescription,
                                  style: Styles.grey14Regular,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: RouteManagement.goToUploadPrescription,
                            child: Container(
                              width: Dimens.eightyFive,
                              height: Dimens.thirtyFive,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.four),
                                  color: AppColors.primaryColor),
                              child: Center(
                                child: Text(
                                  StringConstants.upload,
                                  style: Styles.boldWhite16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight15,
                _controller.homePageResponse == null
                    ? Shimmer.fromColors(
                        child: Padding(
                            padding: Dimens.edgeInsets20_0_20_0,
                            child: Container(
                              height: Dimens.oneHundredFifty,
                              width: Dimens.hundred,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.twelve),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff6EB3F5),
                                    Color(0xff2CD3BF),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Dimens.boxHeight5,
                                  Text(
                                    '',
                                    style: Styles.whiteLight16,
                                  )
                                ],
                              ),
                            )),
                        baseColor: Colors.grey.withOpacity(.5),
                        highlightColor: Colors.white.withOpacity(.4),
                      )
                    : (_controller.homePageResponse != null &&
                            _controller.homePageResponse!.data != null &&
                            _controller.homePageResponse!.data!
                                .any((element) => element.type == 'BANNER'))
                        ? CarouselSlider(
                            options: CarouselOptions(
                                height: Dimens.oneHundredFifty,
                                viewportFraction: .95,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                aspectRatio: 16 / 9),
                            items: _controller.homeWidgetBanner,
                          )
                        : Dimens.box0,
                Dimens.boxHeight20,
                _controller.homeWidgetDataGrid.isNotEmpty
                    ? Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: Text(
                          StringConstants.commonHealthIssues,
                          style: Styles.boldBlack14w700,
                        ),
                      )
                    : Dimens.box0,
                _controller.homeWidgetDataGrid.isNotEmpty
                    ? Dimens.boxHeight10
                    : Dimens.box0,
                _controller.homePageResponse == null
                    ? Shimmer.fromColors(
                        child: Padding(
                          padding: Dimens.edgeInsets20_0_20_0,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 6,
                            padding: Dimens.edgeInsets0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 3,
                                    childAspectRatio: .2 / .2),
                            itemBuilder: (context, index) => Container(
                              height: Dimens.hundred,
                              width: Dimens.hundred,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.twelve),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff6EB3F5),
                                    Color(0xff2CD3BF),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Dimens.boxHeight5,
                                  Text(
                                    '',
                                    style: Styles.whiteLight16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        baseColor: Colors.grey.withOpacity(.5),
                        highlightColor: Colors.white.withOpacity(.4),
                      )
                    : _controller.homeWidgetDataGrid.isNotEmpty
                        ? Padding(
                            padding: Dimens.edgeInsets20_0_20_0,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: _controller.homeWidgetDataGrid.length,
                              padding: Dimens.edgeInsets0,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 3,
                                      childAspectRatio: .2 / .2),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () async {
                                  // _controller.selectedGridItem = index;
                                  _controller.widgetId =
                                      _controller.homeWidgetDataGrid[index].id;
                                  await _controller.searchMedicine(
                                      searchText: '',
                                      isSearchMedicine: false,
                                      widgetId: _controller
                                          .homeWidgetDataGrid[index].id);
                                  RouteManagement.goToMedicineList(
                                      title:
                                          '${_controller.homeWidgetDataGrid[index].name}');
                                  _controller.update();
                                },
                                child: Container(
                                  height: Dimens.hundred,
                                  width: Dimens.hundred,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.twelve),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff6EB3F5),
                                        Color(0xff2CD3BF),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        height: Dimens.thirtyFive,
                                        width: Dimens.thirtyFive,
                                        imageUrl:
                                            '${_controller.homeWidgetDataGrid[index].mediaUrl}',
                                      ),
                                      Dimens.boxHeight5,
                                      Text(
                                        '${_controller.homeWidgetDataGrid[index].name}',
                                        style: Styles.whiteLight16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Dimens.box0,
                Dimens.boxHeight30,
                (_controller.recentlyViewedResponse.isNotEmpty)
                    ? Dimens.boxHeight30
                    : Dimens.box0,
                (_controller.recentlyViewedResponse.isNotEmpty)
                    ? Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: Text(
                          StringConstants.viewRecent,
                          style: Styles.grey14RegularItalic,
                        ),
                      )
                    : Dimens.box0,
                Dimens.boxHeight20,
                (_controller.recentlyViewedResponse.isNotEmpty)
                    ? Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: SizedBox(
                          height: Dimens.percentHeight(.3),
                          width: Dimens.percentWidth(1),
                          child: ListView.builder(
                            padding: Dimens.edgeInsets0,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                _controller.recentlyViewedResponse.length > 2
                                    ? 2
                                    : _controller.recentlyViewedResponse.length,
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
                                                  child: Image.asset(
                                                    AssetConstants.dummy4,
                                                    width: Dimens.thirty,
                                                    height: Dimens.thirty,
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
                                              width: Dimens.percentWidth(.5),
                                              child: Text(
                                                '${_controller.recentlyViewedResponse[index].productName}',
                                                style: Styles.boldBlack14w700,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: Dimens.percentWidth(.5),
                                            //   child: Text(
                                            //     'Combo pack of 2',
                                            //     style: Styles.grey11Regular,
                                            //   ),
                                            // ),
                                            Dimens.boxHeight10,
                                            SizedBox(
                                              width: Dimens.percentWidth(.65),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '₹${_controller.recentlyViewedResponse[index].listedPrice}',
                                                        style: Styles
                                                            .boldBlack14w700,
                                                      ),
                                                      // Dimens.boxWidth20,
                                                      // (_controller
                                                      //                 .recentlyViewedResponse[
                                                      //                     index]
                                                      //                 .listedPrice ==
                                                      //             _controller
                                                      //                 .recentlyViewedResponse[
                                                      //                     index]
                                                      //                 .discountedPrice ||
                                                      //         _controller
                                                      //                 .recentlyViewedResponse[
                                                      //                     index]
                                                      //                 .listedPrice ==
                                                      //             0)
                                                      //     ? Dimens.box0
                                                      //     : Text(
                                                      //         '₹${_controller.recentlyViewedResponse[index].listedPrice}',
                                                      //         style: Styles
                                                      //             .grey11RegularStriked,
                                                      //       ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  '${_controller.recentlyViewedResponse[index].cartQuantity}' ==
                                                          '0'
                                                      ? InkWell(
                                                          onTap: () async {
                                                            var res = await _controller
                                                                .updateItemInCart(
                                                                    productId:
                                                                        '${_controller.recentlyViewedResponse[index].productId}',
                                                                    cartQuantity:
                                                                        '${_controller.recentlyViewedResponse[index].cartQuantity}',
                                                                    isAddition:
                                                                        true);
                                                            if (res == true) {
                                                              await _controller
                                                                  .recentlyViewed(
                                                                      loading:
                                                                          true);
                                                            }
                                                            _controller
                                                                .update();
                                                          },
                                                          child: Container(
                                                            height: Dimens
                                                                .twentyFive,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .lightGreyColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          Dimens
                                                                              .four),
                                                            ),
                                                            child: Center(
                                                              child: Padding(
                                                                padding: Dimens
                                                                    .edgeInsets30_4_30_4,
                                                                child: Text(
                                                                  StringConstants
                                                                      .add,
                                                                  style: Styles
                                                                      .boldBlack14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      // : Dimens.box0
                                                      : SizedBox(
                                                          width: Dimens
                                                              .percentWidth(.2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  var res = await _controller.updateItemInCart(
                                                                      productId:
                                                                          '${_controller.recentlyViewedResponse[index].productId}',
                                                                      cartQuantity:
                                                                          '${_controller.recentlyViewedResponse[index].cartQuantity}',
                                                                      isAddition:
                                                                          false);
                                                                  if (res ==
                                                                      true) {
                                                                    await _controller.recentlyViewed(
                                                                        loading:
                                                                            true);
                                                                    _controller
                                                                        .update();
                                                                  }
                                                                },
                                                                child: SizedBox(
                                                                  width: Dimens
                                                                      .fifteen,
                                                                  height: Dimens
                                                                      .fifteen,
                                                                  child: Image
                                                                      .asset(
                                                                    AssetConstants
                                                                        .minus,
                                                                    width: Dimens
                                                                        .fifteen,
                                                                    color: '${_controller.recentlyViewedResponse[index].cartQuantity}' == '0'
                                                                        ? Colors
                                                                            .grey
                                                                        : Colors
                                                                            .black,
                                                                  ),
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                '${_controller.recentlyViewedResponse[index].cartQuantity}',
                                                                style: Styles
                                                                    .primary18Bold,
                                                              ),
                                                              const Spacer(),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  var res = await _controller.updateItemInCart(
                                                                      productId:
                                                                          '${_controller.recentlyViewedResponse[index].productId}',
                                                                      cartQuantity:
                                                                          '${_controller.recentlyViewedResponse[index].cartQuantity}',
                                                                      isAddition:
                                                                          true);
                                                                  if (res ==
                                                                      true) {
                                                                    await _controller.recentlyViewed(
                                                                        loading:
                                                                            true);
                                                                    _controller
                                                                        .update();
                                                                  }
                                                                },
                                                                child:
                                                                    Image.asset(
                                                                  AssetConstants
                                                                      .add,
                                                                  width: Dimens
                                                                      .fifteen,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
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
                      )
                    : Dimens.box0,
                Dimens.boxHeight30,
              ],
            ),
          ),
        ),
      );
}
