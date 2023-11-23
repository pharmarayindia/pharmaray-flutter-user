import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoreWidget extends StatefulWidget {
  @override
  State<StoreWidget> createState() => _StoreWidgetState();
}

class _StoreWidgetState extends State<StoreWidget> {
  var refreshController = RefreshController(
      initialRefresh: false, initialLoadStatus: LoadStatus.idle);
  var homeController = Get.find<HomeController>();
  var textEditingController = TextEditingController();
  var debouncer = Debouncer();

  @override
  void initState() {
    homeController.getStorePageList(
        searchText: textEditingController.text,
        isLoading: false,
        skip: homeController.storeSkip,
        limit: homeController.storeLimit);
    super.initState();
  }

  void onDataLoading() async {
    unawaited(refreshController.requestRefresh());
    refreshController.footerMode!.value = LoadStatus.loading;
    setState(() {});
    homeController.storeSkip = homeController.storeSkip + 10;
    homeController.storeLimit = homeController.storeLimit + 10;
    await homeController.getStorePageList(
        searchText: textEditingController.text,
        isLoading: false,
        skip: homeController.storeSkip,
        limit: homeController.storeLimit);
    refreshController.footerMode!.value = LoadStatus.idle;
    refreshController.refreshCompleted(resetFooterState: true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => SizedBox(
          width: Dimens.percentWidth(1),
          height: Dimens.percentHeight(1),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: Dimens.edgeInsets20_10_20_0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //   StringConstants.store,
                    //   style: Styles.black20w700,
                    // ),
                    Text(
                      StringConstants.store,
                      style: Styles.black20w700,
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
                                  'productId':
                                      '${_controller.cartResponse?.data?[i].productId}',
                                  'quantity': num.parse(
                                      '${_controller.cartResponse?.data?[i].quantity}')
                                });
                              }
                              await _controller.getCartTotals(
                                  loading: true, couponCode: null, list: list);
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
                                    _controller.cartResponse!.data!.isNotEmpty)
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
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.searchFieldOuterColor),
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: FormFieldWidget(
                    fillColor: AppColors.searchFieldInnerColor,
                    contentPadding: Dimens.edgeInsets18,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.greyLight,
                    ),
                    hintText: textEditingController.text.isEmpty
                        ? StringConstants.searchMedicinesInStore
                        : null,
                    hintStyle: Styles.grey18Regular,
                    onChange: (val) {
                      debouncer.run(() {
                        homeController.getStorePageList(
                            searchText: textEditingController.text,
                            isLoading: true,
                            skip: homeController.storeSkip,
                            limit: homeController.storeLimit);
                      });
                      _controller.update();
                    },
                    textEditingController: textEditingController,
                  ),
                ),
              ),
              Padding(
                padding: Dimens.edgeInsets20_0_20_0,
                child: SizedBox(
                  height: Dimens.percentHeight(.74),
                  width: Dimens.percentWidth(1),
                  child: SmartRefresher(
                    controller: refreshController,
                    enablePullUp: true,
                    onLoading: onDataLoading,
                    onRefresh: onDataLoading,
                    footer: CustomFooter(
                      builder: (context, mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = const Text('Pull up to load more');
                        } else if (mode == LoadStatus.loading) {
                          body = const CupertinoActivityIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = const Text('Load failed. Click to retry!');
                        } else if (mode == LoadStatus.canLoading) {
                          body = const Text('Release to load more');
                        } else {
                          body = const Text('No more items');
                        }
                        return SizedBox(
                          height: Dimens.fifty,
                          child: Center(
                            child: body,
                          ),
                        );
                      },
                    ),
                    enablePullDown: false,
                    child: _controller.isStoreLoading
                        ? Shimmer.fromColors(
                            child: ListView.builder(
                              padding: Dimens.edgeInsets0,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index1) => Padding(
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
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                                  '',
                                                  style: Styles.boldBlack14w700,
                                                ),
                                              ),
                                              Dimens.boxHeight10,
                                              SizedBox(
                                                width: Dimens.percentWidth(.65),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '₹',
                                                          style: Styles
                                                              .boldBlack14w700,
                                                        ),
                                                        Dimens.boxWidth20,
                                                        Text(
                                                          '₹',
                                                          style: Styles
                                                              .grey11RegularStriked,
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    '' == '0'
                                                        ? InkWell(
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
                                                                            Dimens.four),
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
                                                                .percentWidth(
                                                                    .2),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  child:
                                                                      SizedBox(
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
                                                                      color: '' ==
                                                                              '0'
                                                                          ? Colors
                                                                              .grey
                                                                          : Colors
                                                                              .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                Text(
                                                                  '',
                                                                  style: Styles
                                                                      .primary18Bold,
                                                                ),
                                                                const Spacer(),
                                                                InkWell(
                                                                  child: Image
                                                                      .asset(
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
                            baseColor: Colors.grey.withOpacity(.5),
                            highlightColor: Colors.white.withOpacity(.4),
                          )
                        : _controller.storePageList.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Not able to find medicine?',
                                    style: Styles.grey14Medium,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'You can contact us directly via Call/WhatsApp and book your Medicines/Pathology tests.',
                                    style: Styles.black14,
                                    textAlign: TextAlign.center,
                                  ),
                                  Dimens.boxHeight20,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FormSubmitWidget(
                                        text: 'Whatsapp',
                                        textStyle: Styles.whiteLight16,
                                        buttonWidth: Dimens.percentWidth(.42),
                                        padding: Dimens.edgeInsets10_0_10_0,
                                        isIconShowLeft: true,
                                        iconPath: AssetConstants.whatsapp,
                                        buttonColor: AppColors.whatsappGreen,
                                        onTap: () {
                                          launchUrlString(
                                            'https://wa.me/918488015200?text=Hello%20PharmaRay%2C%20i%20am%20looking%20for%20pathology%20lab%20test.',
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        },
                                      ),
                                      FormSubmitWidget(
                                        text: 'Call',
                                        textStyle: Styles.whiteLight16,
                                        buttonWidth: Dimens.percentWidth(.42),
                                        padding: Dimens.edgeInsets10_0_10_0,
                                        isIconShowLeft: true,
                                        iconPath:
                                            AssetConstants.contactPharmacy,
                                        iconColor: Colors.white,
                                        buttonColor: AppColors.whatsappGreen,
                                        onTap: () {
                                          launchUrl(
                                              Uri.parse('tel://+918488015200'));
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : ListView.builder(
                                padding: Dimens.edgeInsets0,
                                physics: const BouncingScrollPhysics(),
                                itemCount: _controller.storePageList.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: Dimens.edgeInsets0_10_0_0,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onPanDown: (DragDownDetails details) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: Dimens.sixty,
                                                height: Dimens.sixty,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .lightGreyColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimens.five),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    Dimens.ten),
                                                      ),
                                                      child: Center(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: _controller
                                                                          .storePageList[
                                                                              index]
                                                                          .images !=
                                                                      null &&
                                                                  _controller
                                                                      .storePageList[
                                                                          index]
                                                                      .images!
                                                                      .isNotEmpty
                                                              ? 'http://194.163.176.83:9000/${_controller.storePageList[index].images?.first.filePath}'
                                                              : '',
                                                          errorWidget: (a, b,
                                                                  dynamic c) =>
                                                              Image.asset(
                                                            AssetConstants
                                                                .dummy4,
                                                            width:
                                                                Dimens.thirty,
                                                            height:
                                                                Dimens.thirty,
                                                          ),
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
                                                    width:
                                                        Dimens.percentWidth(.6),
                                                    child: Text(
                                                      '${_controller.storePageList[index].productName}',
                                                      style: Styles
                                                          .boldBlack14w700,
                                                    ),
                                                  ),
                                                  Dimens.boxHeight10,
                                                  SizedBox(
                                                    width: Dimens.percentWidth(
                                                        .72),
                                                    child: Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '₹${_controller.storePageList[index].listedPrice}',
                                                              style: Styles
                                                                  .boldBlack14w700,
                                                            ),
                                                            // Dimens.boxWidth20,
                                                            // (_controller
                                                            //                 .storePageList[
                                                            //                     index]
                                                            //                 .listedPrice ==
                                                            //             _controller
                                                            //                 .storePageList[
                                                            //                     index]
                                                            //                 .discountedPrice ||
                                                            //         _controller
                                                            //                 .storePageList[
                                                            //                     index]
                                                            //                 .listedPrice ==
                                                            //             0)
                                                            //     ? Dimens.box0
                                                            //     : Text(
                                                            //         '₹${_controller.storePageList[index].listedPrice}',
                                                            //         style: Styles
                                                            //             .grey11RegularStriked,
                                                            //       ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        _controller.storePageList[index].cartQuantity ==
                                                                0
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  var res = await _controller.updateItemInCart(
                                                                      productId:
                                                                          '${_controller.storePageList[index].productId}',
                                                                      cartQuantity:
                                                                          _controller.storePageList[index].cartQuantity ?? 0,
                                                                      isAddition:
                                                                          true);
                                                                  if (res ==
                                                                      true) {
                                                                    await _controller.getStorePageList(
                                                                        searchText:
                                                                            '',
                                                                        isLoading:
                                                                            true,
                                                                        skip: _controller
                                                                            .storeSkip,
                                                                        limit: _controller
                                                                            .storeLimit);
                                                                    await _controller.getCartItems(
                                                                        isLoading:
                                                                            true);
                                                                  }
                                                                  _controller
                                                                      .update();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: Dimens
                                                                      .twentyFive,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: AppColors
                                                                        .lightGreyColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            Dimens.four),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          Dimens
                                                                              .edgeInsets30_4_30_4,
                                                                      child:
                                                                          Text(
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
                                                                    .percentWidth(
                                                                        .2),
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
                                                                                '${_controller.storePageList[index].productId}',
                                                                            cartQuantity:
                                                                                _controller.storePageList[index].cartQuantity ?? 0,
                                                                            isAddition:
                                                                                false);
                                                                        if (res ==
                                                                            true) {
                                                                          await _controller.getStorePageList(
                                                                              searchText: '',
                                                                              isLoading: true,
                                                                              skip: _controller.storeSkip,
                                                                              limit: _controller.storeLimit);
                                                                          await _controller.getCartItems(
                                                                              isLoading: true);
                                                                          _controller
                                                                              .update();
                                                                        }
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width: Dimens
                                                                            .fifteen,
                                                                        height:
                                                                            Dimens.fifteen,
                                                                        child: Image
                                                                            .asset(
                                                                          AssetConstants
                                                                              .minus,
                                                                          width:
                                                                              Dimens.fifteen,
                                                                          color: '${_controller.storePageList[index].cartQuantity}' == '0'
                                                                              ? Colors.grey
                                                                              : Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const Spacer(),
                                                                    Text(
                                                                      '${_controller.storePageList[index].cartQuantity}',
                                                                      style: Styles
                                                                          .primary18Bold,
                                                                    ),
                                                                    const Spacer(),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        var res = await _controller.updateItemInCart(
                                                                            productId:
                                                                                '${_controller.storePageList[index].productId}',
                                                                            cartQuantity:
                                                                                _controller.storePageList[index].cartQuantity ?? 0,
                                                                            isAddition:
                                                                                true);
                                                                        if (res ==
                                                                            true) {
                                                                          await _controller.getStorePageList(
                                                                              searchText: '',
                                                                              isLoading: true,
                                                                              skip: _controller.storeSkip,
                                                                              limit: _controller.storeLimit);
                                                                          await _controller.getCartItems(
                                                                              isLoading: true);
                                                                          _controller
                                                                              .update();
                                                                        }
                                                                      },
                                                                      child: Image
                                                                          .asset(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
