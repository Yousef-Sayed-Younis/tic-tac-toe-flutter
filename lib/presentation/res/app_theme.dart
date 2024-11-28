import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getLightTheme() {
    return ThemeData(
      fontFamily: "Cairo",
      scaffoldBackgroundColor: AppColors.backgroundColor,
      //
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          foregroundColor: Colors.white,
          minimumSize: const Size(135, 40),
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.primaryColor,
          shadowColor: const Color.fromRGBO(33, 150, 243, .5),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          elevation: 10,
          surfaceTintColor: Colors.transparent,
          foregroundColor: AppColors.primaryColor,
          backgroundColor: AppColors.backgroundColor,
          shadowColor: const Color.fromRGBO(33, 150, 243, .5),
        ),
      ),

      radioTheme: const RadioThemeData(fillColor: WidgetStatePropertyAll(AppColors.primaryColor)),

      snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.white, behavior: SnackBarBehavior.floating),
    );
  }
}
