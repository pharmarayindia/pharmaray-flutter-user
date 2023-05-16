import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmaray/lib.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
// coverage:ignore-file
abstract class Styles {
  static RoundedRectangleBorder buttonShapeBorder = RoundedRectangleBorder(
    side: BorderSide(
      color: Colors.white,
      width: Dimens.one,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.circular(
      Dimens.fifty,
    ),
  );

  static RoundedRectangleBorder border15 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      Dimens.fifteen,
    ),
  );

  // light theme data
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    primarySwatch: const MaterialColor(
      AppColors.primaryColorHex,
      AppColors.primaryColorSwatch,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.rubik().fontFamily,
    textTheme: TextTheme(
      bodyText1: bodyTextLight1,
      bodyText2: bodyTextLight2,
      subtitle1: subtitleLight1,
      subtitle2: subtitleLight2,
      caption: captionLight,
      button: buttonLight,
      headline1: headlineLight1,
      headline2: headlineLight2,
      headline3: headlineLight3,
      headline4: headlineLight4,
      headline5: headlineLight5,
      headline6: headlineLight6,
    ),
    buttonTheme: buttonThemeData,
    elevatedButtonTheme: elevatedButtonTheme,
    textButtonTheme: textButtonTheme,
  );

  static TextStyle mediumWhite16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.normal,
    color: AppColors.backgroundColor,
    fontSize: Dimens.sixTeen,
  );

  static var elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        mediumWhite16,
      ),
      padding: MaterialStateProperty.all(
        Dimens.edgeInsets15,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimens.five,
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => AppColors.primaryColor,
      ),
    ),
  );

  static TextStyle boldWhite16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.sixTeen,
    color: Colors.white,
  );

  static TextStyle boldWhite14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    color: Colors.white,
  );
  static var textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        normalWhite18,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimens.fifty,
          ),
        ),
      ),
    ),
  );

  static TextStyle normalWhite18 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.white,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static ButtonThemeData buttonThemeData = ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.fifty,
        ),
      ));

  static TextStyle whiteLight14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
  static TextStyle whiteLight12 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twelve,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white12 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twelve,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  // Different style used in the application
  // light
  static TextStyle bodyTextLight1 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyTextLight2 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.sixTeen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bottomNavInactive = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twelve,
    color: AppColors.bottomNavInactive,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bottomNavActive = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twelve,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.normal,
  );
  static TextStyle subtitleLight1 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.titleGreyColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle blue12 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightBlue,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle lightRed12 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.red,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle red16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.red,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.bold,
  );
  static TextStyle red14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.red,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.bold,
  );
  static TextStyle primary14Bold = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle primary16Bold = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.bold,
  );
  static TextStyle primary16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle primary14BoldDarkColor = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColorDark,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle primary12BoldDarkColor = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColorDark,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.bold,
  );
  static TextStyle primary12BoldColor = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.bold,
  );
  static TextStyle primary16BoldDarkColor = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColorDark,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.bold,
  );
  static TextStyle primary18Bold = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );
  static TextStyle primary18 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
  );
  static TextStyle primary10 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.ten,
    fontWeight: FontWeight.normal,
  );
  static TextStyle blackSevenTeenMedium = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.black,
    fontSize: Dimens.seventeen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle whiteLight16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.white,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subtitleLight2 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.titleGreyColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle captionLight = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.titleGreyColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle cream16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.creamDark,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle yellow12 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.yellowColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle buttonLight = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle headlineLight1 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twentySix,
    color: AppColors.lightGreyColor2,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight2 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twentyTwo,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight3 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twenty,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight4 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.eighteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight5 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.sixTeen,
    color: AppColors.lightGreyColor2,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight6 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.white,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle loginPageTitleBlack = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twentyTwo,
    color: Colors.black,
  );

  static TextStyle loginPageSubTitleGrey = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    color: AppColors.greyColor,
    height: 1.4,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldBlack14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    color: Colors.black,
  );

  static TextStyle boldBlack12 = TextStyle(
      fontFamily: GoogleFonts.rubik().fontFamily,
      fontSize: Dimens.twelve,
      color: Colors.black,
      fontWeight: FontWeight.w700);

  static TextStyle black12 = TextStyle(
      fontFamily: GoogleFonts.rubik().fontFamily,
      fontSize: Dimens.twelve,
      color: Colors.black,
      fontWeight: FontWeight.normal);

  static TextStyle black32 = TextStyle(
      fontFamily: GoogleFonts.rubik().fontFamily,
      fontSize: Dimens.thirtyTwo,
      color: Colors.black,
      fontWeight: FontWeight.w100);

  static TextStyle boldBlack14w700 = TextStyle(
      fontFamily: GoogleFonts.rubik().fontFamily,
      fontSize: Dimens.fourteen,
      color: Colors.black,
      fontWeight: FontWeight.w700);

  static TextStyle darkGreen16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreen,
  );

  static TextStyle darkBlue16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: AppColors.darkBlue,
  );

  static TextStyle boldBlack16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.sixTeen,
    color: Colors.black,
  );

  static TextStyle paymentColor = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
    color: AppColors.paymentColor,
  );

  static TextStyle boldBlack16W700 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.sixTeen,
    color: Colors.black,
  );

  static TextStyle boldBlack18 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle grey18 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
    color: AppColors.lightGreyHintText,
  );

  static TextStyle boldBlack18W400 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle black18 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.eighteen,
    color: Colors.black,
  );

  static TextStyle regularBlack20 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.twenty,
    color: Colors.black,
  );

  static TextStyle mediumBlack16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.sixTeen,
    color: Colors.black,
  );

  static TextStyle black16 = TextStyle(
      fontFamily: GoogleFonts.rubik().fontFamily,
      fontSize: Dimens.sixTeen,
      color: Colors.black,
      fontWeight: FontWeight.normal);

  static TextStyle buttonBlackTextStyle = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.black,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle buttonWhiteTextStyle = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: Colors.white,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle grey14Underline = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  static TextStyle grey14Medium = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle grey14MediumW700 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyLight,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle grey16w500 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyLight,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w500,
  );
  static TextStyle grey14Primary = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey14Regular = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyLight,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey16Regular = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyLight,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey18Regular = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyLight,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey12Regular = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle green12Regular = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greenColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey11Regular = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightGreyHintText,
    fontSize: Dimens.eleven,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey11RegularStriked = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightGreyHintText,
    fontSize: Dimens.eleven,
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey14RegularItalic = TextStyle(
      fontFamily: GoogleFonts.rubik().fontFamily,
      color: AppColors.lightGreyHintText,
      fontSize: Dimens.fourteen,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic);
  static TextStyle grey10Regular = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyColor,
    fontSize: Dimens.ten,
    fontWeight: FontWeight.normal,
  );

  static TextStyle primary14Underline = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );
  static TextStyle black14BoldUnderline = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );
  static TextStyle grey12 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightGreyHintText,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle grey12W500 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyLight,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.bold,
  );
  static TextStyle grey14W500 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.greyLight,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.bold,
  );
  static TextStyle black14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w100,
  );
  static TextStyle lightGrey12 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightGreyHintText,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w100,
  );
  static TextStyle accountColor14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.accountColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w100,
  );
  static TextStyle black14w700 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle cardItemTitleBlack = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w100,
  );

  static TextStyle toolbarTitleBlack = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w100,
  );

  static TextStyle cardItemDesBlack = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w300,
  );
  static TextStyle black13Light = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.thirteen,
    fontWeight: FontWeight.w100,
  );
  static TextStyle black13Medium = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.blackColor,
    fontSize: Dimens.thirteen,
    fontWeight: FontWeight.w100,
  );

  static TextStyle lightGreyHint = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightGreyHintText,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle lightGrey14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightGreyHintText,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle lightGrey16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.lightGreyHintText,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle darkGrey14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.darkGreyHintText,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle pathology14Light = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.pathologyColor1,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle pathologyDetailColor = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.pathologyDetailColor1,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle pathology14BoldDark = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.pathologyColor2,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle blackBold14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.darkGreyHintText,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle black20 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.darkGreyHintText,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w500,
  );

  static TextStyle black20w700 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.darkGreyHintText,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle primaryMedium28 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColorDark,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.w900,
  );

  static TextStyle orderSummaryBlack14 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.orderSummaryColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle orderSummaryBoldBlack16 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.orderSummaryColor,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle primaryBold28 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColorDark,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.w900,
  );

  static TextStyle primaryBold28w700 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColorDark,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.w700,
  );

  static TextStyle primaryBold24 = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.primaryColor,
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.bold,
  );

  static TextStyle darkGreyHint = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    color: AppColors.titleGreyColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle errorStyle = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
    color: AppColors.textFieldErrorColor,
  );
  static TextStyle formFieldTextStyle = TextStyle(
    fontFamily: GoogleFonts.rubik().fontFamily,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
    fontSize: Dimens.sixTeen,
  );
  static BoxDecoration whiteRadius25 = BoxDecoration(
    border: Border.all(width: Dimens.two, color: Colors.white),
    color: Colors.white,
    borderRadius: BorderRadius.circular(Dimens.twentyFive),
  );
}
