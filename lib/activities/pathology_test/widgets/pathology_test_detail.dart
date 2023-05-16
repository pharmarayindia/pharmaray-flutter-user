import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:readmore/readmore.dart';

class PathologyTestDetail extends StatefulWidget {
  @override
  State<PathologyTestDetail> createState() => _PathologyTestDetailState();
}

class _PathologyTestDetailState extends State<PathologyTestDetail> {
  final homeController = Get.find<HomeController>();

  final args = Get.arguments as Map<String, dynamic>;

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
            title: '',
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
        body: SizedBox(
          width: Dimens.percentWidth(1),
          height: Dimens.percentHeight(1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Dimens.percentWidth(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimens.ten),
                      bottomRight: Radius.circular(Dimens.ten),
                    ),
                    color: AppColors.searchFieldOuterColor,
                  ),
                  child: Padding(
                    padding: Dimens.edgeInsets15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: args['isSingle'] == true
                              ? Dimens.percentWidth(.8)
                              : Dimens.percentWidth(.8),
                          child: Text(
                            '${args['title']}',
                            style: Styles.primaryBold24,
                          ),
                        ),
                        args['subTitle'] == null
                            ? Dimens.box0
                            : Dimens.boxHeight10,
                        args['subTitle'] == null
                            ? Dimens.box0
                            : SizedBox(
                                width: Dimens.percentWidth(.8),
                                child: Text(
                                  '${args['subTitle']}',
                                  style: Styles.pathology14Light,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: Dimens.edgeInsets20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetConstants.pathologyIcon1,
                            width: Dimens.fifteen,
                            height: Dimens.fifteen,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            'Reports available in 2 days',
                            style: Styles.pathology14Light,
                          ),
                        ],
                      ),
                      Dimens.boxHeight10,
                      Row(
                        children: [
                          Image.asset(
                            AssetConstants.pathologyIcon2,
                            width: Dimens.fifteen,
                            height: Dimens.fifteen,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            'Home sample collection available',
                            style: Styles.pathology14Light,
                          ),
                        ],
                      ),
                      Dimens.boxHeight10,
                      const Divider(),
                      args['isSingle'] == true
                          ? Dimens.boxHeight10
                          : Dimens.box0,
                      args['isSingle'] == false
                          ? Padding(
                              padding: Dimens.edgeInsets5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tests Include(48)',
                                    style: Styles.grey14W500,
                                  ),
                                  ReadMoreText(
                                    testsList.join(', '),
                                    trimLines: 3,
                                    colorClickableText: Colors.pink,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: StringConstants.readMore,
                                    trimExpandedText: StringConstants.readLess,
                                    moreStyle: Styles.primary14BoldDarkColor,
                                    lessStyle: Styles.primary14BoldDarkColor,
                                    style: Styles.lightGrey12,
                                  ),
                                  // GridView(
                                  //   shrinkWrap: true,
                                  //   physics: const BouncingScrollPhysics(),
                                  //   padding: Dimens.edgeInsets0,
                                  //   gridDelegate:
                                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                                  //           mainAxisSpacing: 0,
                                  //           crossAxisSpacing: 0,
                                  //           crossAxisCount: 2,
                                  //           childAspectRatio: 1 / .15),
                                  //   children: List<Widget>.generate(
                                  //         itemCount,
                                  //         (index) => Container(
                                  //           height: Dimens.twenty,
                                  //           width: Dimens.twenty,
                                  //           decoration: BoxDecoration(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(
                                  //                     Dimens.twelve),
                                  //           ),
                                  //           child: Column(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.center,
                                  //             children: [
                                  //               Row(
                                  //                 children: [
                                  //                   Dimens.boxWidth10,
                                  //                   Text(
                                  //                     '\u2022 Sugar test',
                                  //                     style: Styles.lightGrey12,
                                  //                     textAlign: TextAlign.left,
                                  //                   ),
                                  //                 ],
                                  //               )
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       ) +
                                  //       [
                                  //         Padding(
                                  //           padding: EdgeInsets.fromLTRB(
                                  //               Dimens.ten, 0, 0, 0),
                                  //           child: InkWell(
                                  //             onTap: () {
                                  //               itemCount += 10;
                                  //               setState(() {});
                                  //             },
                                  //             child: Row(
                                  //               children: [
                                  //                 Text(
                                  //                   '+41 more',
                                  //                   style: Styles
                                  //                       .primary12BoldColor,
                                  //                 ),
                                  //                 Dimens.boxWidth5,
                                  //                 Image.asset(
                                  //                   AssetConstants.dropDown,
                                  //                   color:
                                  //                       AppColors.primaryColor,
                                  //                   width: Dimens.fifteen,
                                  //                   height: Dimens.fifteen,
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         )
                                  //       ],
                                  // )
                                ],
                              ),
                            )
                          : Dimens.box0,
                      args['isSingle'] == false ? const Divider() : Dimens.box0,
                      args['isSingle'] == false
                          ? Dimens.boxHeight10
                          : Dimens.box0,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringConstants.totalIncludingTax,
                            style: Styles.pathology14Light,
                          ),
                          Text(
                            '₹79',
                            style: Styles.pathology14BoldDark,
                          ),
                        ],
                      ),
                      Dimens.boxHeight10,
                      const Divider(),
                      Dimens.boxHeight10,
                      Text(
                        'Details',
                        style: Styles.grey14W500,
                      ),
                      Dimens.boxHeight10,
                      ReadMoreText(
                        'Crocin is a general pain reliever, taken as tablet on medical prescription by the physician or medical consultant\n\n Crocin has been shown to be an antioxidant and neural protective agent. The antioxidant behavior of crocin is related to the sugar moiety in crocin molecule which has a vital role in its chemical reactivity.[6] It has also been shown to have an antiproliferative action against cancer cells in vitro.Limited evidence suggests possible antidepressant. Crocin is a general pain reliever, taken as tablet on medical prescription by the physician or medical consultant\n\n Crocin has been shown to be an antioxidant and neural protective agent. The antioxidant behavior of crocin is related to the sugar moiety in crocin molecule which has a vital role in its chemical reactivity.[6] It has also been shown to have an antiproliferative action against cancer cells in vitro.Limited evidence suggests possible antidepressant \n\n',
                        trimLines: 3,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        style: Styles.pathologyDetailColor,
                        trimCollapsedText: StringConstants.readMore,
                        trimExpandedText: StringConstants.readLess,
                        moreStyle: Styles.primary14BoldDarkColor,
                        lessStyle: Styles.primary14BoldDarkColor,
                      ),
                      Dimens.boxHeight20,
                      Container(
                        height: Dimens.fourty,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.five),
                          color: AppColors.primaryColor,
                        ),
                        child: Padding(
                          padding: Dimens.edgeInsets5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                StringConstants.addToCart,
                                style: Styles.whiteLight14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Dimens.boxHeight20,
              ],
            ),
          ),
        ),
      );
}
