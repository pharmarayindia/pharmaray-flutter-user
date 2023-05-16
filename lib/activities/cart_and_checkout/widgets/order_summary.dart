import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class OrderSummary extends StatefulWidget {
  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  var ordersController = Get.find<OrdersController>();

  @override
  void initState() {
    ordersController.getOrderDetails(
        isLoading: false, orderId: Get.arguments as String? ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.orderSummary,
          ),
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
        ),
        body: GetBuilder<OrdersController>(
            builder: (_controller) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetConstants.orderSummary,
                            width: Dimens.eighty,
                            height: Dimens.eighty,
                          ),
                        ],
                      ),
                      Dimens.boxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConstants.orderPlacedSuccessfully,
                            style: Styles.black16,
                          ),
                        ],
                      ),
                      Padding(
                        padding: Dimens.edgeInsets20,
                        child: Container(
                          width: Dimens.percentWidth(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.ten),
                            color: const Color(0xffF7F8FB),
                          ),
                          child: Padding(
                            padding: Dimens.edgeInsets10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants.orderSummary1,
                                  style: Styles.lightGrey16,
                                ),
                                (_controller.orderDetailsResponse != null &&
                                        _controller
                                                .orderDetailsResponse!.data !=
                                            null &&
                                        _controller.orderDetailsResponse!.data!
                                                .orderProducts !=
                                            null &&
                                        _controller.orderDetailsResponse!.data!
                                            .orderProducts!.isNotEmpty)
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _controller
                                            .orderDetailsResponse!
                                            .data!
                                            .orderProducts
                                            ?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: Dimens.edgeInsets0,
                                        itemBuilder: (context, index) {
                                          var qty = num.tryParse(
                                                  '${_controller.orderDetailsResponse?.data?.orderProducts?[index].quantity}') ??
                                              1;
                                          var price = num.tryParse(
                                                  '${_controller.orderDetailsResponse?.data?.orderProducts?[index].listedPrice}') ??
                                              1;
                                          var total = qty * price;
                                          return Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimens.ten),
                                            ),
                                            child: Padding(
                                              padding: Dimens.edgeInsets5,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: Dimens.sixty,
                                                    height: Dimens.sixty,
                                                    child: Image.asset(
                                                      AssetConstants.dummy3,
                                                      width: Dimens.fifteen,
                                                      height: Dimens.fifteen,
                                                    ),
                                                  ),
                                                  Dimens.boxWidth10,
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            Dimens.percentWidth(
                                                                .5),
                                                        child: Text(
                                                          '${_controller.orderDetailsResponse?.data?.orderProducts?[index].productName}',
                                                          style: Styles.black14,
                                                        ),
                                                      ),
                                                      Dimens.boxHeight20,
                                                      SizedBox(
                                                        width:
                                                            Dimens.percentWidth(
                                                                .6),
                                                        child: Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'Qty: ',
                                                                  style: Styles
                                                                      .black14,
                                                                ),
                                                                Text(
                                                                  '${_controller.orderDetailsResponse?.data?.orderProducts?[index].quantity}',
                                                                  style: Styles
                                                                      .black14w700,
                                                                ),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '₹',
                                                                  style: Styles
                                                                      .black14,
                                                                ),
                                                                Text(
                                                                  '$total',
                                                                  style: Styles
                                                                      .black14w700,
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Dimens.box0,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.priceDetails,
                              style: Styles.lightGrey16,
                            ),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.totalMRP,
                                  style: Styles.orderSummaryBlack14,
                                ),
                                const Spacer(),
                                Text(
                                  '₹${_controller.orderDetailsResponse?.data?.subTotal}',
                                  style: Styles.orderSummaryBlack14,
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.discountOnMRP,
                                  style: Styles.orderSummaryBlack14,
                                ),
                                const Spacer(),
                                Text(
                                  '-₹${_controller.orderDetailsResponse?.data?.discountTotal}',
                                  style: Styles.orderSummaryBlack14,
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.deliveryCharges,
                                  style: Styles.orderSummaryBlack14,
                                ),
                                const Spacer(),
                                Text(
                                  ('${_controller.orderDetailsResponse?.data?.grandTotal}' ==
                                              '' ||
                                          '${_controller.orderDetailsResponse?.data?.grandTotal}' ==
                                              '0')
                                      ? 'FREE'
                                      : '${_controller.orderDetailsResponse?.data?.shippingCharges}',
                                  style: Styles.orderSummaryBlack14,
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            const Divider(),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.totalAmount,
                                  style: Styles.orderSummaryBoldBlack16,
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      '₹${_controller.orderDetailsResponse?.data?.grandTotal}',
                                      style: Styles.orderSummaryBoldBlack16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Dimens.boxHeight30,
                            InkWell(
                              onTap: () {
                                Utility.closeSnackbar();
                                Phoenix.rebirth(context);
                                RouteManagement.goToHome();
                              },
                              child: Container(
                                width: Dimens.percentWidth(1),
                                height: Dimens.fifty,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.ten),
                                    color: AppColors.primaryColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      StringConstants.goToHome,
                                      style: Styles.whiteLight16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
      );
}
