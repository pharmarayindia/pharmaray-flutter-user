import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:readmore/readmore.dart';

class PathologyTestView extends StatefulWidget {
  @override
  State<PathologyTestView> createState() => _PathologyTestViewState();
}

class _PathologyTestViewState extends State<PathologyTestView> {
  final homeController = Get.find<HomeController>();

  // int itemCount=9;

  List<String> testsList = [
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test',
    'Sugar test'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
          child: CustomAppBar(
            title: StringConstants.pathologyTests,
            action: Row(
              children: [
                Padding(
                  padding: Dimens.edgeInsets5,
                  child: InkWell(
                    onTap: (homeController.cartResponse != null &&
                            homeController.cartResponse?.data != null &&
                            homeController.cartResponse!.data!.isNotEmpty)
                        ? () async {
                            var list = <dynamic>[];
                            for (var i = 0;
                                i < homeController.cartResponse!.data!.length;
                                i++) {
                              list.add({
                                'productId': num.parse(
                                    '${homeController.cartResponse?.data?[i].productId}'),
                                'quantity': num.parse(
                                    '${homeController.cartResponse?.data?[i].quantity}')
                              });
                            }
                            await homeController.getCartTotals(
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
                          (homeController.cartResponse != null &&
                                  homeController.cartResponse?.data != null &&
                                  homeController.cartResponse!.data!.isNotEmpty)
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    radius: Dimens.eight,
                                    backgroundColor: Colors.red,
                                    child: Center(
                                      child: Text(
                                        '${homeController.cartResponse?.data?.length}',
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
                ),
                Dimens.boxWidth10,
              ],
            ),
          ),
        ),
        body: GetBuilder<PathologyTestController>(
          builder: (_controller) => SizedBox(
            width: Dimens.percentWidth(1),
            height: Dimens.percentHeight(.9),
            child: SingleChildScrollView(
              child: Padding(
                padding: Dimens.edgeInsets20_0_20_0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.searchFieldOuterColor),
                        borderRadius: BorderRadius.circular(Dimens.ten),
                      ),
                      child: FormFieldWidget(
                        fillColor: AppColors.searchFieldInnerColor,
                        contentPadding: Dimens.edgeInsets18,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.greyLight,
                        ),
                        hintText: StringConstants.searchYourReportHere,
                        hintStyle: Styles.grey18Regular,
                      ),
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Dimens.percentWidth(.43),
                          height: Dimens.fiftyFive,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
                            ),
                            color: AppColors.storeColor1,
                          ),
                          child: Row(
                            children: [
                              Dimens.boxWidth5,
                              Image.asset(
                                AssetConstants.pathology1,
                                width: Dimens.thirty,
                                height: Dimens.thirty,
                              ),
                              Dimens.boxWidth10,
                              SizedBox(
                                width: Dimens.percentWidth(.28),
                                child: Text(
                                  StringConstants.mostAffordablePrices,
                                  style: Styles.primary12BoldDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: Dimens.percentWidth(.43),
                          height: Dimens.fiftyFive,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
                            ),
                            color: AppColors.storeColor1,
                          ),
                          child: Row(
                            children: [
                              Dimens.boxWidth5,
                              Image.asset(
                                AssetConstants.pathology3,
                                width: Dimens.thirty,
                                height: Dimens.thirty,
                              ),
                              Dimens.boxWidth10,
                              SizedBox(
                                width: Dimens.percentWidth(.28),
                                child: Text(
                                  StringConstants.freeHomeSamplePickup,
                                  style: Styles.primary12BoldDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Dimens.percentWidth(.43),
                          height: Dimens.fiftyFive,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
                            ),
                            color: AppColors.storeColor1,
                          ),
                          child: Row(
                            children: [
                              Dimens.boxWidth5,
                              Image.asset(
                                AssetConstants.pathology2,
                                width: Dimens.thirty,
                                height: Dimens.thirty,
                              ),
                              Dimens.boxWidth10,
                              SizedBox(
                                width: Dimens.percentWidth(.28),
                                child: Text(
                                  StringConstants.painlessSampleConnection,
                                  style: Styles.primary12BoldDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: Dimens.percentWidth(.43),
                          height: Dimens.fiftyFive,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
                            ),
                            color: AppColors.storeColor1,
                          ),
                          child: Row(
                            children: [
                              Dimens.boxWidth5,
                              Image.asset(
                                AssetConstants.pathology4,
                                width: Dimens.thirty,
                                height: Dimens.thirty,
                              ),
                              Dimens.boxWidth10,
                              SizedBox(
                                width: Dimens.percentWidth(.28),
                                child: Text(
                                  StringConstants.getReport,
                                  style: Styles.primary12BoldDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Dimens.boxHeight10,
                          TabBar(
                            labelStyle: Styles.primary14Bold,
                            indicatorColor: AppColors.primaryColor,
                            physics: const NeverScrollableScrollPhysics(),
                            labelColor: AppColors.backgroundColor,
                            unselectedLabelColor: Colors.black,
                            unselectedLabelStyle: Styles.grey14Medium,
                            indicatorSize: TabBarIndicatorSize.tab,
                            onTap: _controller.onTapTab,
                            tabs: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: _controller.selectedTab == 0
                                      ? Colors.transparent
                                      : Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.five),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimens.ten,
                                ),
                                child: Text(StringConstants.checkUpKits,
                                    textAlign: TextAlign.center,
                                    style: _controller.selectedTab == 0
                                        ? Styles.boldBlack14w700
                                        : Styles.lightGrey14),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: _controller.selectedTab == 1
                                      ? Colors.transparent
                                      : Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.five),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimens.ten,
                                ),
                                child: Text(
                                  StringConstants.singleTests,
                                  style: _controller.selectedTab == 1
                                      ? Styles.boldBlack14w700
                                      : Styles.lightGrey14,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxHeight10,
                          SizedBox(
                            width: Dimens.percentWidth(1),
                            height: Dimens.percentHeight(.6),
                            child: TabBarView(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: Dimens.edgeInsets0,
                                  itemCount: 20,
                                  itemBuilder: (context, index) => Padding(
                                    padding: Dimens.edgeInsets0_0_0_10,
                                    child: InkWell(
                                      onTap: () {
                                        RouteManagement.goToPathologyTestDetail(
                                            title:
                                                'Pharmaray Launch Consultation',
                                            subTitle:
                                                '12 Specialised Tests + 24 Regular Tests',
                                            isSingle: false);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimens.ten,
                                          ),
                                          border: Border.all(
                                            color:
                                                AppColors.searchFieldOuterColor,
                                          ),
                                        ),
                                        width: Dimens.percentWidth(1),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Dimens.percentWidth(1),
                                              height: Dimens.sixty,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE0F3FF),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      Dimens.ten),
                                                  topLeft: Radius.circular(
                                                      Dimens.ten),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: Dimens.edgeInsets10,
                                                child: Row(
                                                  children: [
                                                    Image.asset(AssetConstants
                                                        .appLogoWithOutColor),
                                                    Dimens.boxWidth10,
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: Dimens
                                                              .percentWidth(.7),
                                                          child: Text(
                                                            'Pharmaray Launch Consultation',
                                                            style: Styles
                                                                .primary16BoldDarkColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Dimens
                                                              .percentWidth(.7),
                                                          child: Text(
                                                            '12 Specialised Tests + 24 Regular Tests',
                                                            style:
                                                                Styles.grey12,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: Dimens.edgeInsets5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tests (48)',
                                                    style: Styles.grey12W500,
                                                  ),
                                                  ReadMoreText(
                                                    testsList.join(', '),
                                                    trimLines: 3,
                                                    colorClickableText:
                                                        Colors.pink,
                                                    trimMode: TrimMode.Line,
                                                    trimCollapsedText:
                                                        StringConstants
                                                            .readMore,
                                                    trimExpandedText:
                                                        StringConstants
                                                            .readLess,
                                                    moreStyle: Styles
                                                        .primary14BoldDarkColor,
                                                    lessStyle: Styles
                                                        .primary14BoldDarkColor,
                                                    style: Styles.lightGrey12,
                                                  ),
                                                  // GridView(
                                                  //   shrinkWrap: true,
                                                  //   physics: const BouncingScrollPhysics(),
                                                  //   // itemCount: 6,
                                                  //   padding: Dimens.edgeInsets0,
                                                  //   gridDelegate:
                                                  //   const SliverGridDelegateWithFixedCrossAxisCount(
                                                  //       mainAxisSpacing: 0,
                                                  //       crossAxisSpacing: 0,
                                                  //       crossAxisCount: 2,
                                                  //       childAspectRatio: 1 / .15),
                                                  //   children: List<Widget>.generate(
                                                  //       itemCount,
                                                  //           (index) => Container(
                                                  //         height: Dimens.twenty,
                                                  //         width: Dimens.twenty,
                                                  //         decoration: BoxDecoration(
                                                  //           borderRadius:
                                                  //           BorderRadius.circular(
                                                  //               Dimens.twelve),
                                                  //         ),
                                                  //         child: Column(
                                                  //           crossAxisAlignment:
                                                  //           CrossAxisAlignment
                                                  //               .start,
                                                  //           mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .center,
                                                  //           children: [
                                                  //             Row(
                                                  //               children: [
                                                  //                 Dimens.boxWidth10,
                                                  //                 Text(
                                                  //                   '\u2022 Sugar test',
                                                  //                   style: Styles
                                                  //                       .lightGrey12,
                                                  //                   textAlign:
                                                  //                   TextAlign.left,
                                                  //                 ),
                                                  //               ],
                                                  //             )
                                                  //           ],
                                                  //         ),
                                                  //       )) +
                                                  //       [
                                                  //         Padding(
                                                  //           padding: EdgeInsets.fromLTRB(
                                                  //               Dimens.ten, 0, 0, 0),
                                                  //           child: InkWell(
                                                  //             onTap: (){
                                                  //               itemCount+=10;
                                                  //               setState(() {
                                                  //
                                                  //               });
                                                  //             },
                                                  //             child: Row(
                                                  //               children: [
                                                  //                 Text(
                                                  //                   '+41 more',
                                                  //                   style: Styles
                                                  //                       .primary12BoldColor,
                                                  //                 ),
                                                  //                 Dimens.boxWidth5,
                                                  //                 Image.asset(AssetConstants.dropDown,color: AppColors.primaryColor,width: Dimens.fifteen,height: Dimens.fifteen,),
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //         )
                                                  //       ],
                                                  // )
                                                ],
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding:
                                                  Dimens.edgeInsets10_0_10_0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '₹1799',
                                                    style: Styles.lightGrey16,
                                                  ),
                                                  Container(
                                                    height: Dimens.thirty,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimens.five),
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          Dimens.edgeInsets5,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            StringConstants
                                                                .addToCart,
                                                            style: Styles
                                                                .whiteLight14,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: Dimens.edgeInsets0,
                                  itemCount: 20,
                                  itemBuilder: (context, index) => Padding(
                                    padding: Dimens.edgeInsets0_0_0_10,
                                    child: InkWell(
                                      onTap: () {
                                        RouteManagement.goToPathologyTestDetail(
                                            title: 'Blood Group Test',
                                            isSingle: true);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimens.ten,
                                          ),
                                          border: Border.all(
                                            color:
                                                AppColors.searchFieldOuterColor,
                                          ),
                                        ),
                                        width: Dimens.percentWidth(1),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Dimens.percentWidth(1),
                                              height: Dimens.sixty,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      Dimens.ten),
                                                  topLeft: Radius.circular(
                                                      Dimens.ten),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: Dimens.edgeInsets10,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        AssetConstants.appLogo),
                                                    Dimens.boxWidth10,
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: Dimens
                                                              .percentWidth(.7),
                                                          child: Text(
                                                            'Pharmaray Launch Consultation',
                                                            style: Styles
                                                                .primary16BoldDarkColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Dimens
                                                              .percentWidth(.7),
                                                          child: Text(
                                                            '12 Specialised Tests + 24 Regular Tests',
                                                            style:
                                                                Styles.grey12,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding:
                                                  Dimens.edgeInsets10_0_10_0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '₹1799',
                                                    style: Styles.lightGrey16,
                                                  ),
                                                  Container(
                                                    height: Dimens.thirty,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimens.five),
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          Dimens.edgeInsets5,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            StringConstants
                                                                .addToCart,
                                                            style: Styles
                                                                .whiteLight14,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Image.asset(
                    //   AssetConstants.noPathology,
                    //   width: Dimens.hundred,
                    //   height: Dimens.hundred,
                    // ),
                    // Text(
                    //   StringConstants.comingSoon,
                    //   style: Styles.lightGrey16,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
