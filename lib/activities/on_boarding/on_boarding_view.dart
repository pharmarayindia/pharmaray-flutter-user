import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmaray/lib.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) => GetBuilder<OnBoardingController>(
        builder: (_controller) => Scaffold(
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(
                width: Dimens.percentWidth(1),
                height: Dimens.percentHeight(1),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetConstants.onBoardingBack,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller.controller,
                      itemCount: _controller.onBoardingItemList.length,
                      itemBuilder: (context, index) => OnBoardingContent(
                        image: _controller.onBoardingItemList[index]['image']
                            .toString(),
                        titleImage: _controller.onBoardingItemList[index]
                            ['titleImage'] as String,
                        subTitle: _controller.onBoardingItemList[index]
                                ['subtitle']
                            .toString(),
                        width: _controller.onBoardingItemList[index]['width']
                            as double?,
                        height: _controller.onBoardingItemList[index]['height']
                            as double,
                      ),
                      onPageChanged: (value) {
                        _controller.currentOnBoardingPage = value;
                        setState(() {});
                      },
                    ),
                  ),
                  DotsIndicator(
                    decorator: DotsDecorator(
                      activeColor: AppColors.primaryColorDark,
                      size: Size(Dimens.five, Dimens.five),
                      activeSize: Size(Dimens.five, Dimens.five),
                    ),
                    dotsCount: _controller.onBoardingItemList.length,
                    position: _controller.currentOnBoardingPage.toDouble(),
                  ),
                  Dimens.boxHeight50,
                  Padding(
                    padding: Dimens.edgeInsets20,
                    child: Column(
                      children: [
                        FormSubmitWidget(
                          text: _controller.currentOnBoardingPage !=
                                  _controller.onBoardingItemList.length - 1
                              ? StringConstants.next
                              : StringConstants.start,
                          textStyle: Styles.whiteLight16,
                          padding: Dimens.edgeInsets10_0_10_0,
                          buttonColor: AppColors.primaryColor,
                          onTap: () async {
                            if (_controller.currentOnBoardingPage ==
                                _controller.onBoardingItemList.length - 1) {
                              await GetStorage('appData')
                                  .write(AppConstants.showOnBoarding, 'true');
                              RouteManagement.goToLogin();
                            } else {
                              await _controller.controller.animateToPage(
                                  _controller.controller.page!.toInt() + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                        ),
                        Dimens.boxHeight30,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
