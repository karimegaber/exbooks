import 'package:exbooks/resources/colors_manager.dart';
import 'package:exbooks/resources/fonts_manager.dart';
import 'package:exbooks/resources/styles_manager.dart';
import 'package:exbooks/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,

    //Main Colors
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.lightPrimary,
    disabledColor: ColorsManager.grey,
    splashColor: ColorsManager.lightPrimary,

    //CardView Theme
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: AppSize.s4.r,
    ),

    //App Bar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManager.white,
      titleTextStyle: getSemiBoldStyle(
          color: ColorsManager.black, fontSize: FontSize.s20.sp),
      elevation: AppSize.s0.r,
      iconTheme: const IconThemeData(
        color: ColorsManager.black,
      ),
    ),

    //Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(
          color: ColorsManager.white,
          fontSize: FontSize.s20.sp,
        ),
        primary: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ),
        shadowColor: ColorsManager.grey,
      ),
    ),

    //Text Theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
        color: ColorsManager.darkGrey,
        fontSize: FontSize.s16.sp,
      ),
      titleMedium: getMediumStyle(
        color: ColorsManager.primary,
        fontSize: FontSize.s16.sp,
      ),
      headlineMedium: getRegularStyle(
        color: ColorsManager.darkGrey,
        fontSize: FontSize.s14.sp,
      ),
      bodyLarge: getRegularStyle(color: ColorsManager.grey),
      bodySmall: getRegularStyle(color: ColorsManager.grey),
      displayLarge: getSemiBoldStyle(
        color: ColorsManager.darkGrey,
        fontSize: FontSize.s16.sp,
      ),
    ),

    //Input Decoration Theme ( Text Form Field )
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8.r),

      // Hint Style
      hintStyle: getRegularStyle(
        color: ColorsManager.grey,
        fontSize: FontSize.s14.sp,
      ),

      // Label Style
      labelStyle: getMediumStyle(
        color: ColorsManager.grey,
        fontSize: FontSize.s14.sp,
      ),

      errorStyle: getRegularStyle(color: ColorsManager.red),

      // Enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: ColorsManager.lightGrey.withOpacity(0.6),
            width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      // Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: ColorsManager.primary, width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //Error Border
      errorBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: ColorsManager.red, width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //Focused Error Border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: ColorsManager.primary, width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
    ),
  );
}

ThemeData appDarkTheme() {
  return ThemeData();
}