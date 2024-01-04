import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme({Color? color}) => ThemeData(
        useMaterial3: true,
        primarySwatch: createMaterialColor(color ?? AppColor.primaryColor),
        primaryColor: color ?? AppColor.primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: color ?? AppColor.primaryColor,
          outlineVariant: AppColor.borderColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.workSans().fontFamily,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
        iconTheme: const IconThemeData(color: AppColor.appTextSecondaryColor),
        textTheme: GoogleFonts.workSansTextTheme(),
        dialogBackgroundColor: Colors.white,
        unselectedWidgetColor: Colors.black,
        dividerColor: AppColor.borderColor,
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: radiusOnly(
              topLeft: defaultRadius,
              topRight: defaultRadius,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        cardColor: AppColor.cardColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: color ?? AppColor.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        dialogTheme: DialogTheme(
          shape: dialogShape(),
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            primaryTextStyle(size: 10),
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );

  static ThemeData darkTheme({Color? color}) => ThemeData(
        useMaterial3: true,
        primarySwatch: createMaterialColor(color ?? AppColor.primaryColor),
        primaryColor: color ?? AppColor.primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: color ?? AppColor.primaryColor,
          outlineVariant: AppColor.borderColor,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        ),
        scaffoldBackgroundColor: AppColor.scaffoldColorDark,
        fontFamily: GoogleFonts.workSans().fontFamily,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.scaffoldSecondaryDark,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: GoogleFonts.workSansTextTheme(),
        dialogBackgroundColor: AppColor.scaffoldSecondaryDark,
        unselectedWidgetColor: Colors.white60,
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: radiusOnly(
              topLeft: defaultRadius,
              topRight: defaultRadius,
            ),
          ),
          backgroundColor: AppColor.scaffoldSecondaryDark,
        ),
        dividerColor: dividerDarkColor,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: color ?? AppColor.primaryColor),
        cardColor: AppColor.scaffoldSecondaryDark,
        dialogTheme: DialogTheme(
          shape: dialogShape(),
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            primaryTextStyle(size: 10, color: Colors.white),
          ),
        ),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}
