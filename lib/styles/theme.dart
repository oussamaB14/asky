import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:asky/styles/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

// class ThemeProvider extends ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.system;

//   bool get isDarkMode {
//     if (themeMode == ThemeMode.system) {
//       final brightness = SchedulerBinding.instance!.window.platformBrightness;
//       return brightness == Brightness.dark;
//     } else {
//       return themeMode == ThemeMode.dark;
//     }
//   }

//   void toggleTheme(bool isOn) {
//     themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
//     notifyListeners();
//   }
// }

class MyThemes {
  final lightTheme = ThemeData(
    //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
    //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
    primaryColor: Colors.white,

    primaryColorLight: MyColors.red,

    indicatorColor: MyColors.red,
    brightness: Brightness.light,
    shadowColor: MyColors.black,
    dividerColor: Colors.grey.withOpacity(0.8),
    colorScheme:
        const ColorScheme.light().copyWith(secondary: Colors.grey[850]),

    //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
    //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
    scaffoldBackgroundColor: const Color(0XFFEDEDED),

    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.black),
        elevation: 0.2,
        centerTitle: true,
        titleSpacing: 16,
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: MyColors.black,
        backgroundColor: Colors.white,
        elevation: 1.0),
    bottomAppBarTheme: BottomAppBarTheme(color: MyColors.green, elevation: 1.0),

    buttonTheme: const ButtonThemeData(
        shape: CircleBorder(), padding: EdgeInsets.all(8)),
    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.black),
        contentTextStyle: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: Colors.black),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      primary: Colors.black,
      backgroundColor: Color(0XFFEDEDED),
      //  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      textStyle: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 13.sp,
        color: MyColors.black,
      ),
    )),
    iconTheme: IconThemeData(color: Colors.grey[850]),
    cardTheme: CardTheme(
        elevation: 0.5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.grey.shade300,
      showCheckmark: false,
      disabledColor: Colors.grey,
      selectedColor: Colors.blue,
      padding: const EdgeInsets.all(12),
      labelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Colors.black),
      brightness: Brightness.light,
      secondarySelectedColor: MyColors.green,
      secondaryLabelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.white),
    ),

    //---------------------------------------------------- TYPOGRAPHY ------------------------------------------------------------------------//
    //---------------------------------------------------- Typography ------------------------------------------------------------------------//
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w800,
          fontSize: 20.sp,
          color: Colors.black),
      headline2: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          color: Colors.black),
      headline3: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: Colors.black),
      bodyText2: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: Colors.black),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "Nunito",
          fontSize: 10.sp,
          color: Colors.black.withOpacity(0.8)),
    ),
  );
  final darkTheme = ThemeData(
    //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
    //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
    scaffoldBackgroundColor: const Color(0xFF212121),
    canvasColor: Colors.grey.shade900,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: Colors.black,
    dividerColor: Colors.grey.withOpacity(0.8),
    brightness: Brightness.dark,
    //  shadowColor: Colors.white,
    primaryIconTheme: const IconThemeData(color: Colors.white),

    primaryColorLight: MyColors.red,

    indicatorColor: MyColors.red,

    //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
    //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//

    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.white),
        elevation: 0.2,
        centerTitle: true,
        titleSpacing: 16,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 1.0),
    bottomAppBarTheme: BottomAppBarTheme(color: MyColors.green, elevation: 1.0),

    buttonTheme: const ButtonThemeData(
        shape: CircleBorder(), padding: EdgeInsets.all(8)),
    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.white),
        contentTextStyle: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: Colors.white),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      primary: Colors.black,
      backgroundColor: Color(0XFFEDEDED),
      // padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
      textStyle: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 13.sp,
        color: Color(0XFFEDEDED),
      ),
    )),

    cardTheme: CardTheme(
        elevation: 0.5,
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.grey.shade800,
      showCheckmark: false,
      disabledColor: Colors.grey,
      selectedColor: MyColors.green,
      padding: const EdgeInsets.all(12),
      labelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Colors.white),
      brightness: Brightness.dark,
      secondarySelectedColor: MyColors.green,
      secondaryLabelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.black),
    ),

    //---------------------------------------------------- TYPOGRAPHY ------------------------------------------------------------------------//
    //---------------------------------------------------- Typography ------------------------------------------------------------------------//
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w800,
          fontSize: 20.sp,
          color: Colors.white),
      headline2: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          color: Colors.white),
      headline3: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: Colors.white),
      bodyText2: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: Colors.white),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "Nunito",
          fontSize: 10.sp,
          color: Colors.white.withOpacity(0.8)),
    ),
    colorScheme: const ColorScheme.dark()
        .copyWith(secondary: Colors.white, background: Color(0xFF212121)),
  );
}

// final themeNotifier = ChangeNotifierProvider.autoDispose<ThemeProvider>((ref) {
//   return ThemeProvider();
// });