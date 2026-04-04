import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColor.primaryColor,
  scaffoldBackgroundColor: const Color(0xffF8F9FA),
  fontFamily: 'Lato',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primaryColor,
    primary: AppColor.primaryColor,
    secondary: AppColor.secondColor,
    surface: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
    foregroundColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColor.primaryColor,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lato',
      color: AppColor.primaryColor,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.grey.shade200),
    ),
    margin: const EdgeInsets.symmetric(vertical: 8),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
    labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: AppColor.grey, height: 1.5),
    bodyMedium: TextStyle(fontSize: 14, color: AppColor.grey),
    labelMedium: TextStyle(fontSize: 14, color: AppColor.primaryColor, fontWeight: FontWeight.w600),
  ),
);

ThemeData themeArabic = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColor.primaryColor,
  scaffoldBackgroundColor: const Color(0xffF8F9FA),
  fontFamily: 'Rubik',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primaryColor,
    primary: AppColor.primaryColor,
    secondary: AppColor.secondColor,
    surface: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
    foregroundColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColor.primaryColor,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'Rubik',
      color: AppColor.primaryColor,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.grey.shade200),
    ),
    margin: const EdgeInsets.symmetric(vertical: 8),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    hintStyle: const TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Rubik'),
    labelStyle: const TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Rubik'),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Rubik'),
    displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Rubik'),
    displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Rubik'),
    headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black, fontFamily: 'Rubik'),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Rubik'),
    bodyLarge: TextStyle(fontSize: 16, color: AppColor.grey, height: 1.5, fontFamily: 'Rubik'),
    bodyMedium: TextStyle(fontSize: 14, color: AppColor.grey, fontFamily: 'Rubik'),
    labelMedium: TextStyle(fontSize: 14, color: AppColor.primaryColor, fontWeight: FontWeight.w600, fontFamily: 'Rubik'),
  ),
);
