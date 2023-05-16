import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({required this.title,this.action});

  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.lightGreyHintText,
          ),
        ),
        actions: [
          action ?? Dimens.box0
        ],
        title: Text(
          title,
          style: Styles.boldBlack16W700,
        ),
      );
}
