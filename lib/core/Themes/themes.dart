import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
class Themes {
 static ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffB7935F),
      primary: const Color(0xffB7935F),
      secondary: const Color(0xffF8F8F8),
      onSecondary: const Color(0xffB7935F),
      onPrimaryContainer:const Color(0xffB3833F) ,
      onPrimary: const Color(0xff141A2E),
      onError: Colors.red
    ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,  
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 27,
      fontFamily: kMainFontFamily,
    )
  ),
  textTheme:const TextTheme(
    bodyLarge: TextStyle(
    fontSize: 26,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  bodySmall: TextStyle(
    fontSize: 16,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  ),
  titleLarge: TextStyle(
    fontSize: 26,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  bodyMedium: TextStyle(
    fontSize: 18,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  ),
  scaffoldBackgroundColor: Colors.transparent,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffB7935F),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Color(0xff242424), size: 34),
      selectedItemColor: Color(0xff242424),
      selectedLabelStyle: TextStyle(
        color: Color(0xff242424),
        fontFamily: kMainFontFamily,
        fontSize: 13,
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffF8F8F8),
        size: 22,
      ),
      unselectedItemColor: Color(0xffF8F8F8),
    ),
);

static ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff141A2E),
      primary: const Color(0xff141A2E),
      secondary: const Color(0xff141A2E),
      onPrimary: const Color(0xffF8F8F8),
      onSecondary: const Color(0xffFACC1A),
      onPrimaryContainer:const Color(0xffFACC1A) ,
      onError: Colors.red,
    ),
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme:const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 27,
      fontFamily: kMainFontFamily,
    ),
  ),
   textTheme:const TextTheme(
    bodyLarge: TextStyle(
    fontSize: 26,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  titleLarge: TextStyle(
    fontSize: 26,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  bodyMedium: TextStyle(
    fontSize: 18,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  bodySmall: TextStyle(
    fontSize: 16,
    fontFamily: kMainFontFamily,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  ),
  ),
   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141A2E),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Color(0xffFACC1D), size: 34),
      selectedItemColor: Color(0xffFACC1D),
      selectedLabelStyle: TextStyle(
        color: Color(0xffFACC1D),
        fontFamily: kMainFontFamily,
        fontSize: 13,
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffF8F8F8),
        size: 22,
      ),
      unselectedItemColor: Color(0xffF8F8F8),
    ),
);
}