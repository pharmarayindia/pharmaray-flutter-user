// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class AppColors {
  static const Map<int, Color> primaryColorSwatch = {
    50: Color.fromRGBO(55, 157, 110, 0.1),
    100: Color.fromRGBO(55, 157, 110, 0.2),
    200: Color.fromRGBO(55, 157, 110, 0.3),
    300: Color.fromRGBO(55, 157, 110, 0.4),
    400: Color.fromRGBO(55, 157, 110, 0.5),
    500: Color.fromRGBO(55, 157, 110, 0.6),
    600: Color.fromRGBO(55, 157, 110, 0.7),
    700: Color.fromRGBO(55, 157, 110, 0.8),
    800: Color.fromRGBO(55, 157, 110, 0.9),
    900: Color.fromRGBO(55, 157, 110, 1.0),
  };

  static const Color primaryColorRgb = Color.fromRGBO(55, 157, 110, 1);

  static const Color primaryColorLight1Rgbo = Color.fromRGBO(1, 75, 147, .1);

  static const Color primaryColor = Color(
    0xff0480FF,
  );

  static const Color primaryColorDark = Color(
    0xff206FCD,
  );

  static const Color orderSummaryColor = Color(
    0xff484D43,
  );

  static const Color formFieldBorderColor = Color(0xff5F527A);

  static Color greyColor = Colors.black.withOpacity(0.6);
  static Color greenColor = const Color(0xff49A35B);

  static const Color lightGreyColor = Color(
    0xFFF1F1F1,
  );
  static const Color lightGreyHintText = Color(
    0xFF66738F,
  );
  static const Color formFieldColor = Color(
    0xFFF9F9F9,
  );
  static const Color darkGreyHintText = Color(
    0xFF192124,
  );
  static const Color pathologyColor1 = Color(
    0xFF5B6573,
  );
  static const Color pathologyDetailColor1 = Color(
    0xFF94969F,
  );
  static const Color pathologyColor2 = Color(
    0xFF707A7C,
  );
  static const Color accountColor = Color(
    0xFF56585E,
  );
  static const Color whatsappGreen = Color(
    0xFF29a71a,
  );
  static const Color paymentColor = Color(
    0xFFB5B7BD,
  );

  static const Color textFieldErrorColor = Color(
    0xffe63f36,
  );

  static const Color textFieldColor = Color(
    0xFFFFFFFF,
  );
  static const Color blackColor = Color(
    0xff000000,
  );
  static const Color storeColor1 = Color(
    0xffEAF1F9,
  );
  static const Color storeBorderColor = Color(
    0xffE6EAEE,
  );
  static const Color reminderContainerBorderColor = Color(
    0xffCDE3F7,
  );

  static const Color textColor = Color(0xff5F527A);

  static const Color borderColor = Colors.transparent;

  static Color backgroundColor = const Color(0xffffffff);
  static Color buttonDisableColor = const Color(0xffBFC7D9);

  static Color secondaryBackgroundColor = const Color(0xffE5E5E5);
  static Color searchFieldInnerColor = const Color(0xffFCFEFF);
  static Color searchFieldOuterColor = const Color(0xffFE0F3FF);

  static const int primaryColorHex = 0xffC11239;

  static const Color transparent = Color.fromARGB(0, 255, 255, 255);

  static const Color titleGreyColor = Color(
    0xFFB2AEAE,
  );
  static const Color lightGreyColor2 = Color(
    0xFF43586B,
  );
  static const Color bottomNavInactive = Color(
    0xff65727E,
  );
  static const Color lightBlue = Color(
    0xff6BB7BF,
  );
  static const Color onTheWayColor = Color(
    0xffC6D669,
  );
  static const Color inProgressColor = Color(
    0xff78E2A3,
  );
  static const Color readyToPickColor = Color(
    0xffDBC67B,
  );
  static const Color completedColor = Color(
    0xff7BE97F,
  );
  static const Color reminderColor = Color(
    0xffEBF7FF,
  );
  static const Color applyColor = Color(
    0xffF6F6F6,
  );
  static const Color deliveredColor = Color(
    0xffE4F6E8,
  );
  static const Color greenLightColor = Color(
    0xff71CB86,
  );
  static const Color greyLightColor = Color(
    0xff767981,
  );
  static const Color dottedBorderColor = Color(
    0xffE9E7E2,
  );
  static const Color medicineDetailContainerColor = Color(
    0xffF8FBFF,
  );
  static const Color uploadColor = Color(
    0xffB1D2ED,
  );
  static const Color darkGreen = Color(
    0xff1F7A54,
  );
  static const Color darkBlue = Color(
    0xff0D57B1,
  );
  static const Color storeColor = Color(
    0xffF3FFD9,
  );
  static const Color pathologyColor = Color(
    0xffEBF8FF,
  );
  static const Color cancelledColor = Color(
    0xffE92020,
  );
  static const Color cream = Color(
    0xffFBE7C3,
  );
  static const Color creamDark = Color(
    0xffBB8111,
  );

  static const Color brownColor = Color(0xFFA25C3F);

  static const Color blueColor = Color(0xff275791);

  static const Color yellowColor = Color(0xffE9B020);

  static const Color redColor = Color(
    0xffE92020,
  );

  static const Color iconDefaultColor = Color(
    0xff4D4D4D,
  );

  static const Color greyLight = Color(
    0xff9EA6B1,
  );
  static const Color circleColor = Color(
    0xffF7FAFB,
  );
  static const Color popularColor = Color(
    0xffFDF2F0,
  );

  static Color themeOppositeColor() =>
      Get.isDarkMode ? Colors.white : backgroundColor;
}
