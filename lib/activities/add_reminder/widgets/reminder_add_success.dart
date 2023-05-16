import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmaray/lib.dart';

class ReminderSuccess extends StatefulWidget {
  @override
  State<ReminderSuccess> createState() => _ReminderSuccessState();
}

class _ReminderSuccessState extends State<ReminderSuccess> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    RouteManagement.goToHome();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.percentWidth(.7),
                  height: Dimens.percentHeight(.6),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Lottie.asset(
                      AssetConstants.reminderSuccess,
                    ),
                  ),
                ),
              ],
            ),
            Dimens.boxHeight20,
            Text(
              StringConstants.reminderAddedSuccessfully,
              style: Styles.black20,
            ),
          ],
        ),
      );
}
