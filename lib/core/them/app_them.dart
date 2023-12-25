import 'package:chef_app/core/utils/app_color.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(
        color: AppColors.black
      ),
      displayMedium: regularStyle(
          color: AppColors.black
      ),
      bodySmall: regularStyle(
          color: AppColors.black
      ),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    //text field
    inputDecorationTheme: InputDecorationTheme(
      //enabled border
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      //focused border
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

      //error border
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

      //hint
      hintStyle: boldStyle(color: AppColors.grey, fontSize: 16),

      //fill color
      // fillColor: AppColors.lightBlack,
      // filled: true,
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.grey),
        textStyle: MaterialStateProperty.all(
          boldStyle(color: AppColors.grey, fontSize: 16),
        ),
      ),
    ),
  );
}


ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.darkThem,
    //appBar theme

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),
    //text theme
    textTheme: TextTheme(
        displayLarge: boldStyle(
          color: AppColors.white
        ),
        displayMedium: regularStyle(
            color: AppColors.white
        ),
      bodySmall: regularStyle(
          color: AppColors.white
      ),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),),

    inputDecorationTheme: InputDecorationTheme(
      //enabled border
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //focused border
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

        //error border
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

        //hint
        hintStyle: boldStyle(color: AppColors.primary, fontSize: 16),

        //fill color
        fillColor: AppColors.white,
        filled: true
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.primary),
        textStyle: MaterialStateProperty.all(
          boldStyle(color: AppColors.primary, fontSize: 16),
        ),
      ),
    ),


  );
}
