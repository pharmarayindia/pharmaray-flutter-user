import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharmaray/lib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OrdersView extends StatefulWidget {
  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  var refreshController = RefreshController(
      initialRefresh: false, initialLoadStatus: LoadStatus.idle);

  var ordersController = Get.find<OrdersController>();

  void onDataLoading() {
    refreshController.footerMode!.value = LoadStatus.loading;
    setState(() {});
    ordersController.page = ordersController.page + 1;
    ordersController.take = ordersController.take;
    ordersController.getOrders(
      isLoading: false,
    );
    refreshController.footerMode!.value = LoadStatus.idle;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.orders,
          ),
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
        ),
        body: GetBuilder<OrdersController>(
          builder: (_controller) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: Dimens.percentWidth(1),
                  height: Dimens.percentHeight(1),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      _controller.ordersList.isNotEmpty
                          ? SizedBox(
                              width: Dimens.percentWidth(1),
                              height: Dimens.percentHeight(.9),
                              child: SmartRefresher(
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
                                      body = const Text(
                                          'Load failed. Click to retry!');
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
                                controller: refreshController,
                                child: ListView.builder(
                                  itemCount: _controller.ordersList.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding: Dimens.edgeInsets20_20_20_10,
                                  itemBuilder: (context, index) => Padding(
                                    padding: Dimens.edgeInsets0_0_0_10,
                                    child: InkWell(
                                      onTap: () async {
                                        // await _controller.getOrderDetails(
                                        //     isLoading: true,
                                        //     orderId:
                                        //         '${_controller.ordersList[index].id}');
                                        RouteManagement.goToOrderSummary(
                                            orderId:
                                                '${_controller.ordersList[index].id}');
                                      },
                                      child: SizedBox(
                                        width: Dimens.percentWidth(1),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Order#${_controller.ordersList[index].id}',
                                                  style: Styles.grey16w500,
                                                ),
                                                Container(
                                                  width: Dimens.seventy,
                                                  height: Dimens.twentyFour,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .deliveredColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimens.six),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${_controller.ordersList[index].status}',
                                                      style:
                                                          Styles.green12Regular,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight5,
                                            SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  ListView.builder(
                                                      itemCount: _controller
                                                          .ordersList[index]
                                                          .orderProducts
                                                          ?.length,
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index1) {
                                                        var qty = num.tryParse(
                                                                '${_controller.ordersList[index].orderProducts?[index1].quantity.toString()}') ??
                                                            1;
                                                        var price = num.tryParse(
                                                                '${_controller.ordersList[index].orderProducts?[index1].listedPrice}') ??
                                                            1;
                                                        var total = qty * price;
                                                        return Column(
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Image.asset(
                                                                  AssetConstants
                                                                      .dummy4,
                                                                  width: Dimens
                                                                      .twenty,
                                                                  height: Dimens
                                                                      .twenty,
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Dimens
                                                                          .percentWidth(
                                                                              .7),
                                                                      child:
                                                                          Text(
                                                                        '${_controller.ordersList[index].orderProducts?[index1].productName}',
                                                                        style: Styles
                                                                            .boldBlack14w700,
                                                                      ),
                                                                    ),
                                                                    // Text(
                                                                    //   'Piramal',
                                                                    //   style: Styles
                                                                    //       .grey12,
                                                                    // ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${_controller.ordersList[index].orderProducts?[index1].quantity}',
                                                                  style: Styles
                                                                      .grey14Medium,
                                                                ),
                                                                Text(
                                                                  '₹${total.toStringAsFixed(2)}',
                                                                  style: Styles
                                                                      .grey14MediumW700,
                                                                ),
                                                              ],
                                                            ),
                                                            const Divider(),
                                                          ],
                                                        );
                                                      },),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${_controller.ordersList[index].status} on ${DateFormat('dd MMM yyyy').format(
                                                    DateTime.parse(
                                                        '${_controller.ordersList[index].createdAt}'),
                                                  )}',
                                                  style: Styles.green12Regular,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    launchUrlString(
                                                      'http://194.163.176.83:9000/api/v1/orders/entire-data/pdf/${_controller.ordersList[index].id}',
                                                      mode: LaunchMode
                                                          .externalApplication,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: Dimens.eighty,
                                                    height: Dimens.thirty,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimens.five),
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          AssetConstants
                                                              .invoice,
                                                          width: Dimens.fifteen,
                                                          height:
                                                              Dimens.fifteen,
                                                          color: Colors.white,
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Text(
                                                          StringConstants
                                                              .invoice,
                                                          style: Styles
                                                              .whiteLight14,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight5,
                                            const Divider(
                                              thickness: 10,
                                              color: Color(0xffFAFAFA),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
                      // (homeController.homePageResponse != null &&
                      //     homeController.homePageResponse!.data != null &&
                      //     homeController.homePageResponse!.data!
                      //         .any((element) => element.type == 'BANNER'))
                      //     ? Padding(
                      //   padding: Dimens.edgeInsets10_0_10_0,
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         StringConstants.pharmaryLabTests,
                      //         style: Styles.boldBlack16W700,
                      //       ),
                      //     ],
                      //   ),
                      // )
                      //     : Dimens.box0,
                      Dimens.boxHeight10,
                      // (homeController.homePageResponse != null &&
                      //     homeController.homePageResponse!.data != null &&
                      //     homeController.homePageResponse!.data!
                      //         .any((element) => element.type == 'BANNER'))
                      //     ? CarouselSlider(
                      //   options: CarouselOptions(
                      //       height: Dimens.oneHundredFifty,
                      //       viewportFraction: .95,
                      //       autoPlayCurve: Curves.fastOutSlowIn,
                      //       autoPlay: true,
                      //       autoPlayInterval: const Duration(seconds: 3),
                      //       aspectRatio: 16 / 9),
                      //   items: homeController.homeWidgetBanner,
                      // )
                      //     : Dimens.box0,
                      Dimens.boxHeight80,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
