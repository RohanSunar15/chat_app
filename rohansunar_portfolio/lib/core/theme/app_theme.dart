import 'package:flutter/material.dart';
import 'package:rohansunar_portfolio/core/theme/app_colors.dart';

class AppTheme{

static final lightTheme =   ThemeData.light().copyWith(
  scaffoldBackgroundColor:AppColors.white,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlue,
  ),
);

}