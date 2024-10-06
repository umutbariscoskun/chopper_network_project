import 'package:chopper_network/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  static final ThemeData appTheme = ThemeData.dark(
    useMaterial3: false,
  ).copyWith(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 30.sp,
      ),
    ),
  );
}
