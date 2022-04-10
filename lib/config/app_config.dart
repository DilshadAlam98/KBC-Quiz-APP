import 'package:flutter/material.dart';
import 'package:quiz_app/config/size_config.dart';

class AppThemeConfig {
  AppThemeConfig._();

  //Light Theme Colors
  static Color tittleColor = const Color(0xffFFFFFF);
  static Color lightPrimaryColor = const Color(0xffF5E8EA);
  static Color lightSecondaryColor = const Color(0xff192533);
  static Color iconColor = const Color(0xffEEF0EB);
  static Color appBackGroundColour = const Color(0xff1c2841);
  static Color appBarColor = const Color(0xff17182b);
  static Color appBackgrounfColor2 = const Color(0xff17182b);
  static Color buttonColor = const Color(0xff3b4451);
  static Color buttomSheetColor = const Color(0xff5e6671);
  static Color redColor = const Color(0xffA52A2A);

  ///Light Theme configuration
  static final lightTheme = ThemeData(
    textTheme: lightTextTheme,
    brightness: Brightness.light,
    backgroundColor: tittleColor,
    primaryColorLight: lightPrimaryColor,
    accentColor: lightSecondaryColor,
    // selectedRowColor: tertiaryColor,
    unselectedWidgetColor: iconColor,
    // toggleButtonsTheme:
    // ToggleButtonsThemeData(color: tertiaryColor, disabledColor: iconColor),
    // buttonTheme: ButtonThemeData(buttonColor: tertiaryColor),
    // toggleableActiveColor: tertiaryColor,
    // visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  ///Light TextTheme configuration
  static final TextTheme lightTextTheme = TextTheme(
    headline4: mainTitle,
    headline5: title,
    subtitle1: subtitle,
    bodyText1: body,
    bodyText2: detail,
  );

  /// Main Title
  static final TextStyle mainTitle = TextStyle(
    fontFamily: "RedHatDisplay-Black",
    fontWeight: FontWeight.bold,
    fontSize: SizeConfig.defaultSize! * 2,
    color:AppThemeConfig.tittleColor
  );


  static final TextStyle mainTitle2 = TextStyle(
      fontFamily: "RedHatDisplay-Black",
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.defaultSize! *2.6,
      color:AppThemeConfig.tittleColor
  );

  /// Title
  static final TextStyle title = TextStyle(
    fontFamily: "RedHatDisplay-Bold",
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.defaultSize! * 1.8,
    color: AppThemeConfig.tittleColor
  );
  /// Title
  static final TextStyle title2 = TextStyle(
      fontFamily: "RedHatDisplay-Bold",
      fontSize: SizeConfig.defaultSize! * 1.8,
      color: AppThemeConfig.tittleColor
  );

  /// Subtitle
  static final TextStyle subtitle = TextStyle(
    fontFamily: "RedHatDisplay-Medium",
    fontWeight: FontWeight.w500,
    color: AppThemeConfig.tittleColor,
    fontSize: 15,
  );

  /// Body
  static const TextStyle body = TextStyle(
    fontFamily: "RedHatDisplay-Regular",
    fontSize: 16,
  );

  /// Detail
  static final TextStyle detail = TextStyle(
    fontFamily: "RedHatDisplay-Regular",
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: AppThemeConfig.tittleColor
  );

  static final TextStyle subtitle2 = TextStyle(
    fontFamily: "RedHatDisplay-Medium",
    fontWeight: FontWeight.w300,
    color:AppThemeConfig.tittleColor,
    fontSize: 13,
  );
  static final TextStyle subtitle3 = TextStyle(
    fontFamily: "RedHatDisplay-Medium",
    color:AppThemeConfig.tittleColor,
    fontSize: 13,
  );
}
