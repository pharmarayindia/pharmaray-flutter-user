import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => WillPopScope(
          onWillPop: () async {
            await Get.dialog<dynamic>(
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
                      borderRadius: BorderRadius.circular(Dimens.twenty),
                    ),
                    child: Padding(
                      padding: Dimens.edgeInsets20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                StringConstants.youWantToExit,
                                style: Styles.boldBlack16W700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: Get.back,
                                child: Container(
                                  width: Dimens.percentWidth(.35),
                                  height: Dimens.thirty,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.five),
                                    border:
                                        Border.all(color: AppColors.greyLight),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  exit(0);
                                },
                                child: Container(
                                  width: Dimens.percentWidth(.35),
                                  height: Dimens.thirty,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.circular(Dimens.five),
                                    border:
                                        Border.all(color: AppColors.greyLight),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        StringConstants.exit,
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
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavBarWidget(),
            extendBodyBehindAppBar: true,
            body: _controller.getItemWidget(_controller.selectedIndex),
          ),
        ),
      );
}

// class HomeScreen extends GetView<HomeController> {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     controller.update();
//     return Scaffold();
//   }
// }
