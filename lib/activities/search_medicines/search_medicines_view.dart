import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmaray/lib.dart';

class SearchMedicines extends StatefulWidget {
  @override
  State<SearchMedicines> createState() => _SearchMedicinesState();
}

class _SearchMedicinesState extends State<SearchMedicines> {
  final FocusNode _focus = FocusNode();
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint('Focus: ${_focus.hasFocus.toString()}');
    setState(() {});
  }

  var debouncer = Debouncer();

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => WillPopScope(
          onWillPop: () async {
            _controller.selectedGridItem = -1;
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: Dimens.edgeInsets15,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        FormFieldWidget(
                          prefixIcon: _focus.hasFocus
                              ? null
                              : Row(
                                  children: [
                                    Dimens.boxWidth5,
                                    const Icon(Icons.search),
                                    Dimens.boxWidth5,
                                    Text(
                                      textEditingController.text.isEmpty
                                          ? StringConstants
                                              .searchMedicinesOrLabTest
                                          : textEditingController.text,
                                      style: Styles.lightGrey16,
                                    ),
                                  ],
                                ),
                          focusNode: _focus,
                          focusedBorder: _focus.hasFocus
                              ? OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.ten),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColorDark),
                                )
                              : null,
                          onChange: (value) {
                            debouncer.run(() {
                              if (value.length > 2) {
                                _controller.searchMedicine(
                                    searchText: value,
                                    isSearchMedicine: true,
                                    widgetId: null);
                                _focus.unfocus();
                              }
                            });
                          },
                          isReadOnly:
                              _controller.selectedGridItem == -1 ? false : true,
                          onTap: () {
                            textEditingController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: textEditingController.text.length));
                          },
                          textEditingController: textEditingController,
                          fillColor: Colors.white,
                          contentPadding: Dimens.edgeInsets16,
                          formBorder: const OutlineInputBorder(),
                          textInputType: TextInputType.text,
                          suffixIcon: _focus.hasFocus
                              ? Padding(
                                  padding: Dimens.edgeInsets0_0_10_0,
                                  child: InkWell(
                                    onTap: () {
                                      if (textEditingController.text.isEmpty) {
                                        Get.back<dynamic>();
                                        _controller.selectedGridItem = -1;
                                        _controller.searchMedicineResponse =
                                            null;
                                        _controller.update();
                                      } else {
                                        textEditingController.clear();
                                        _controller.searchMedicineResponse =
                                            null;
                                        _controller.update();
                                      }
                                    },
                                    child: Image.asset(
                                      AssetConstants.cancel,
                                      width: Dimens.ten,
                                      height: Dimens.ten,
                                    ),
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {
                                    Get.back<dynamic>();
                                    _controller.selectedGridItem = -1;
                                  },
                                  child: Text(
                                    StringConstants.cancel,
                                    style: Styles.black14,
                                  ),
                                ),
                        ),
                        Dimens.boxHeight10,
                        (_controller.searchPageListResponse != null &&
                                _controller.searchPageListResponse!.data !=
                                    null &&
                                _controller
                                    .searchPageListResponse!.data!.isNotEmpty)
                            ? SizedBox(
                                width: Dimens.percentWidth(1),
                                height: Dimens.thirty,
                                child: ListView.builder(
                                  itemCount: _controller.searchPageListResponse
                                      ?.data?[0].widgets?.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
                                    padding: Dimens.edgeInsets5_0_5_0,
                                    child: InkWell(
                                      onTap: () {
                                        _controller.selectedGridItem = index;
                                        _controller.searchMedicine(
                                            searchText: '',
                                            isSearchMedicine: true,
                                            widgetId: _controller
                                                .searchPageListResponse
                                                ?.data?[0]
                                                .widgets?[index]
                                                .id);
                                        _controller.update();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimens.eight),
                                            border: Border.all(
                                                color:
                                                    AppColors.primaryColorDark),
                                            color:
                                                _controller.selectedGridItem ==
                                                        index
                                                    ? AppColors.primaryColorDark
                                                    : Colors.white),
                                        child: Padding(
                                          padding: Dimens.edgeInsets5,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${_controller.searchPageListResponse?.data?[0].widgets?[index].name}',
                                                style: _controller
                                                            .selectedGridItem ==
                                                        index
                                                    ? Styles.boldWhite14
                                                    : Styles
                                                        .primary14BoldDarkColor,
                                              ),
                                              _controller.selectedGridItem ==
                                                      index
                                                  ? InkWell(
                                                      onTap: () {
                                                        _controller
                                                            .selectedGridItem = -1;
                                                        _controller
                                                                .searchMedicineResponse =
                                                            null;
                                                        _controller.update();
                                                      },
                                                      child: SizedBox(
                                                        width: Dimens.twenty,
                                                        height: Dimens.twenty,
                                                        child: Icon(
                                                          Icons.cancel_outlined,
                                                          size: Dimens.fifteen,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  : Dimens.box0,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Dimens.box0,
                        (_controller.searchMedicineResponse == null ||
                                _controller.searchMedicineResponse?.data ==
                                    null ||
                                _controller
                                    .searchMedicineResponse!.data!.isEmpty)
                            ? Image.asset(
                                AssetConstants.noMedicine,
                                width: Dimens.percentWidth(.5),
                                height: Dimens.percentHeight(.5),
                              )
                            : SizedBox(
                                width: Dimens.percentWidth(1),
                                height: Dimens.percentHeight(.64),
                                child: ListView.builder(
                                  itemCount: _controller
                                      .searchMedicineResponse?.data?.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
                                    padding: Dimens.edgeInsets0_15_0_0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: Dimens.percentWidth(.65),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ((_controller.searchMedicineResponse?.data?[index].source?.medicine_image ?? "").isEmpty) || (_controller.searchMedicineResponse?.data?[index].source?.medicine_image  == null)  ?
                                              Image.asset(
                                                AssetConstants.dummy4,
                                                width: Dimens.twenty,
                                                height: Dimens.twenty,
                                              ) :

                                                  CachedNetworkImage(imageUrl: '${_controller.searchMedicineResponse?.data?[index].source?.medicine_image}',width: Dimens.twenty,
                                                    height: Dimens.twenty,placeholder: (context, url) => getImage(context,AssetConstants.dummy4),errorWidget: (context, url, error) => SizedBox(
                                                      width: Dimens.twenty,
                                                      height: Dimens.twenty,
                                                      child: getImage(context,AssetConstants.dummy4),
                                                    ),)
                                              ,
                                              Dimens.boxWidth10,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        Dimens.percentWidth(.5),
                                                    child: Text(
                                                      '${_controller.searchMedicineResponse?.data?[index].source?.productName}',
                                                      style: Styles.boldBlack16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimens.percentWidth(.5),
                                                    child: Text(
                                                      '${_controller.searchMedicineResponse?.data?[index].source?.brand}',
                                                      style:
                                                          Styles.grey11Regular,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimens.percentWidth(.25),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap:
                                                    '${_controller.searchMedicineResponse?.data?[index].source?.cartQuantity}' ==
                                                            '0'
                                                        ? null
                                                        : () async {
                                                            var res = await _controller
                                                                .updateItemInCart(
                                                                    productId:
                                                                        '${_controller.searchMedicineResponse?.data?[index].source?.productId}',
                                                                    cartQuantity:
                                                                        _controller.searchMedicineResponse?.data?[index].source?.cartQuantity ?? 0,
                                                                    isAddition:
                                                                        false);
                                                            if (res == true) {
                                                              await _controller.searchMedicine(
                                                                  searchText:
                                                                      textEditingController
                                                                          .text,
                                                                  isSearchMedicine:
                                                                      true,
                                                                  widgetId:
                                                                      null);
                                                              await _controller
                                                                  .getCartItems(
                                                                      isLoading:
                                                                          true);
                                                              await _controller
                                                                  .postRecentlyViewed(
                                                                isLoading:
                                                                    false,
                                                                productId:
                                                                    '${_controller.searchMedicineResponse?.data?[index].source?.productId}',
                                                              );
                                                            }
                                                          },
                                                child: SizedBox(
                                                  width: Dimens.fifteen,
                                                  height: Dimens.fifteen,
                                                  child: Image.asset(
                                                    AssetConstants.minus,
                                                    width: Dimens.fifteen,
                                                    color:
                                                        '${_controller.searchMedicineResponse?.data?[index].source?.cartQuantity}' ==
                                                                '0'
                                                            ? Colors.grey
                                                            : Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${_controller.searchMedicineResponse?.data?[index].source?.cartQuantity}',
                                                style: Styles.primary18Bold,
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () async {
                                                  var res = await _controller.updateItemInCart(
                                                      productId:
                                                          '${_controller.searchMedicineResponse?.data?[index].source?.productId}',
                                                      cartQuantity:
                                                          _controller.searchMedicineResponse?.data?[index].source?.cartQuantity ?? 0,
                                                      isAddition: true);
                                                  if (res == true) {
                                                    await _controller
                                                        .searchMedicine(
                                                            searchText:
                                                                textEditingController
                                                                    .text,
                                                            isSearchMedicine:
                                                                true,
                                                            widgetId: null);
                                                    await _controller
                                                        .getCartItems(
                                                            isLoading: true);
                                                    await _controller
                                                        .postRecentlyViewed(
                                                      isLoading: false,
                                                      productId:
                                                          '${_controller.searchMedicineResponse?.data?[index].source?.productId}',
                                                    );
                                                  }
                                                },
                                                child: Image.asset(
                                                  AssetConstants.add,
                                                  width: Dimens.fifteen,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        Dimens.box0,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: Dimens.edgeInsets15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Note: Must take doctor advice before purchasing any medicine.',
                      style: Styles.black12,
                    ),
                  ),
                  (_controller.cartResponse != null &&
                          _controller.cartResponse?.data != null &&
                          _controller.cartResponse!.data!.isNotEmpty)
                      ? InkWell(
                          onTap: () async {
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
                                loading: true,
                                couponCode: null,
                                list: list);
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
                        )
                      : Dimens.box0,
                ],
              ),
            ),
          ),
        ),
      );

}
