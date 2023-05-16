import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class BottomNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => BottomNavigationBar(
          selectedFontSize: Dimens.twelve,
          backgroundColor: Colors.white,
          unselectedFontSize: Dimens.twelve,
          unselectedItemColor: AppColors.greyLight,
          currentIndex: _controller.selectedIndex,
          selectedItemColor: AppColors.primaryColor,
          onTap: _controller.onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.home,
                  width: Dimens.twentyFive,
                  color: AppColors.greyLight,
                ),
              ),
              label: StringConstants.home,
              activeIcon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.home,
                  width: Dimens.twentyFive,
                  color: _controller.selectedIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.greyLight,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.reminder,
                  width: Dimens.twentyFive,
                  color: AppColors.greyLight,
                ),
              ),
              label: StringConstants.reminder,
              activeIcon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.reminder,
                  width: Dimens.twentyFive,
                  color: _controller.selectedIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.greyLight,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.storeBottom,
                  width: Dimens.twentyFive,
                  color: AppColors.greyLight,
                ),
              ),
              label: StringConstants.store,
              activeIcon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.storeBottom,
                  width: Dimens.twentyFive,
                  color: _controller.selectedIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.greyLight,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.account,
                  width: Dimens.twentyFive,
                  color: AppColors.greyLight,
                ),
              ),
              label: StringConstants.account,
              activeIcon: SizedBox(
                width: Dimens.twenty,
                height: Dimens.twenty,
                child: SvgPicture.asset(
                  AssetConstants.account,
                  width: Dimens.twentyFive,
                  color: _controller.selectedIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.greyLight,
                ),
              ),
            ),
          ],
        ),
      );
}
