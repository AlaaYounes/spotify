import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.black,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.black,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Satoshi',
        color: Colors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.grey,
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Satoshi',
        color: const Color(0xff383838),
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.white,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.white,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Satoshi',
        color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.grey,
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Satoshi',
        color: const Color(0xffA7A7A7),
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
