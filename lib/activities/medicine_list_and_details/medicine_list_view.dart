import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class MedicineList extends StatefulWidget {
  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  var args = Get.arguments as String? ?? '';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeController>(
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
                          Dimens.boxWidth10,
                          Text(
                            (args == '')
                                ? StringConstants.generalMedicines
                                : args,
                            style: Styles.black20,
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
                            : null,
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
                args == '' ? Dimens.box0 : Dimens.boxHeight20,
                args != ''
                    ? Dimens.box0
                    : Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.searchFieldOuterColor),
                            borderRadius: BorderRadius.circular(Dimens.ten),
                          ),
                          child: FormFieldWidget(
                            fillColor: AppColors.searchFieldInnerColor,
                            contentPadding: Dimens.edgeInsets18,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppColors.greyLight,
                            ),
                            hintText: StringConstants.searchMedicinesInStore,
                            hintStyle: Styles.grey18Regular,
                          ),
                        ),
                      ),
                Padding(
                  padding: Dimens.edgeInsets20_5_20_5,
                  child: Text(
                    '${StringConstants.showingAll} ${_controller.searchMedicineResponse?.data?.length} ${StringConstants.products}',
                    style: Styles.grey12,
                  ),
                ),
                (_controller.searchMedicineResponse == null ||
                        _controller.searchMedicineResponse?.data == null ||
                        _controller.searchMedicineResponse!.data!.isEmpty)
                    ? Padding(
                        padding: Dimens.edgeInsets100,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0, -Dimens.oneHundredFifty, 0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AssetConstants.noMedicine),
                                fit: BoxFit.contain),
                          ),
                          width: Dimens.percentWidth(.5),
                          height: Dimens.percentHeight(.8),
                        ),
                      )
                    : SizedBox(
                        width: Dimens.percentWidth(1),
                        height: Dimens.percentHeight(.8),
                        child: ListView.builder(
                          itemCount:
                              _controller.searchMedicineResponse?.data?.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                            padding: Dimens.edgeInsets0_15_0_0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Dimens.percentWidth(.65),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetConstants.dummy4,
                                        width: Dimens.twenty,
                                        height: Dimens.twenty,
                                      ),
                                      Dimens.boxWidth10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Dimens.percentWidth(.5),
                                            child: Text(
                                              '${_controller.searchMedicineResponse?.data?[index].source?.productName}',
                                              style: Styles.boldBlack16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimens.percentWidth(.5),
                                            child: Text(
                                              '${_controller.searchMedicineResponse?.data?[index].source?.brand}',
                                              style: Styles.grey11Regular,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                                '${_controller.searchMedicineResponse?.data?[index].source?.cartQuantity}',
                                                            isAddition: false);
                                                    if (res == true) {
                                                      await _controller
                                                          .getCartItems(
                                                              isLoading: true);
                                                      await _controller
                                                          .postRecentlyViewed(
                                                        isLoading: false,
                                                        productId:
                                                            '${_controller.searchMedicineResponse?.data?[index].source?.productId}',
                                                      );
                                                      await _controller
                                                          .searchMedicine(
                                                              searchText: '',
                                                              isSearchMedicine:
                                                                  false,
                                                              widgetId:
                                                                  _controller
                                                                      .widgetId);
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
                                                  '${_controller.searchMedicineResponse?.data?[index].source?.cartQuantity}',
                                              isAddition: true);
                                          if (res == true) {
                                            await _controller.getCartItems(
                                                isLoading: true);
                                            await _controller
                                                .postRecentlyViewed(
                                              isLoading: false,
                                              productId:
                                                  '${_controller.searchMedicineResponse?.data?[index].source?.productId}',
                                            );
                                            await _controller.searchMedicine(
                                                searchText: '',
                                                isSearchMedicine: false,
                                                widgetId: _controller.widgetId);
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
                Padding(
                  padding: Dimens.edgeInsets20_0_0_0,
                  child: Text(
                    'Note: Must take doctor advice before purchasing any medicine.',
                    style: Styles.black12,
                  ),
                ),
                Dimens.boxHeight10,
              ],
            ),
          ),
        ),
      );
}
