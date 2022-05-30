import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: MyColor.primaryColor,
      splashColor: MyColor.secondaryColor,
      scaffoldBackgroundColor: MyColor.backgroundColor,
      backgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: MyColor.primaryColor,
        secondary: MyColor.secondaryColor,
      ),
      textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MyColor.statusBarColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),

      //Text Field Theme
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: MyColor.greyTextColor,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: const Color(0xFFF2F3F7),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      ),

      //Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: MyColor.primaryColor,
          onPrimary: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 22,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
