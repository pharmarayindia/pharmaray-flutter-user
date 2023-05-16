import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmaray/lib.dart';

class AccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => SizedBox(
          width: Dimens.percentWidth(1),
          height: Dimens.percentHeight(1),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Container(
                width: Dimens.percentWidth(1),
                height: Dimens.percentHeight(.25),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetConstants.accountBack),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: Dimens.edgeInsets20_20_20_10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, ${_controller.profileResponse?.data?.fullName}',
                            style: Styles.primaryMedium28,
                          ),
                          // SizedBox(
                          //   width: Dimens.twentyFour,
                          //   height: Dimens.twentyFour,
                          //   child: IconButton(
                          //     onPressed: () {},
                          //     icon: const Icon(
                          //       Icons.edit,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      ('${_controller.profileResponse?.data?.email}' == '' ||
                              '${_controller.profileResponse?.data?.email}' ==
                                  'null')
                          ? Dimens.box0
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Dimens.boxHeight10,
                                Text(
                                  '${_controller.profileResponse?.data?.email}',
                                  style: Styles.accountColor14,
                                ),
                              ],
                            ),
                      Dimens.boxHeight10,
                      Text(
                        '${_controller.profileResponse?.data?.area}' == 'null'
                            ? '${_controller.profileResponse?.data?.mobile}'
                            : '${_controller.profileResponse?.data?.area} \t ${_controller.profileResponse?.data?.mobile}',
                        style: Styles.accountColor14,
                      ),
                      Dimens.boxHeight15,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: Dimens.edgeInsets20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: RouteManagement.goToOrdersView,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetConstants.orders,
                            width: Dimens.twenty,
                            height: Dimens.twenty,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            StringConstants.orders,
                            style: Styles.black18,
                          ),
                        ],
                      ),
                    ),
                    // Dimens.boxHeight20,
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       AssetConstants.labTests,
                    //       width: Dimens.twenty,
                    //       height: Dimens.twenty,
                    //     ),
                    //     Dimens.boxWidth10,
                    //     Text(
                    //       StringConstants.labTests,
                    //       style: Styles.black18,
                    //     ),
                    //   ],
                    // ),
                    Dimens.boxHeight20,
                    InkWell(
                      onTap: RouteManagement.goToAddressBook,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetConstants.addressBook,
                            width: Dimens.twenty,
                            height: Dimens.twenty,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            StringConstants.addressBook,
                            style: Styles.black18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: Dimens.edgeInsets20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: RouteManagement.goToContactPharmacy,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetConstants.contactPharmacy,
                            width: Dimens.twenty,
                            height: Dimens.twenty,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            StringConstants.contactPharmacy,
                            style: Styles.black18,
                          ),
                        ],
                      ),
                    ),
                    // Dimens.boxHeight20,
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       AssetConstants.referAndEarn,
                    //       width: Dimens.twenty,
                    //       height: Dimens.twenty,
                    //     ),
                    //     Dimens.boxWidth10,
                    //     Text(
                    //       StringConstants.referAndEarn,
                    //       style: Styles.black18,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: Dimens.edgeInsets20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.dialog<dynamic>(
                          Material(
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                Dimens.thirty,
                                Dimens.percentHeight(.4),
                                Dimens.thirty,
                                Dimens.percentHeight(.4),
                              ),
                              child: Container(
                                width: Dimens.percentWidth(.8),
                                height: Dimens.percentHeight(.2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.twenty),
                                ),
                                child: Padding(
                                  padding: Dimens.edgeInsets20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            StringConstants.continueTo,
                                            style: Styles.black16,
                                          ),
                                          Text(
                                            StringConstants.to,
                                            style: Styles.black16,
                                          ),
                                          Text(
                                            StringConstants.logout,
                                            style: Styles.boldBlack16W700,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: Get.back,
                                            child: Container(
                                              width: Dimens.percentWidth(.35),
                                              height: Dimens.thirty,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimens.five),
                                                border: Border.all(
                                                    color: AppColors.greyLight),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    StringConstants.cancel,
                                                    style: Styles.lightGrey16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await GetStorage('appData')
                                                  .erase();
                                              await Get.delete<
                                                  HomeController>();
                                              RouteManagement.goToLogin();
                                            },
                                            child: Container(
                                              width: Dimens.percentWidth(.35),
                                              height: Dimens.thirty,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimens.five),
                                                border: Border.all(
                                                    color: AppColors.greyLight),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    StringConstants.logout1,
                                                    style: Styles.whiteLight16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            AssetConstants.signOut,
                            width: Dimens.twenty,
                            height: Dimens.twenty,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            StringConstants.signOut,
                            style: Styles.black18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
