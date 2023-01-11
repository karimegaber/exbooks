import 'package:easy_localization/easy_localization.dart';
import 'package:exbooks/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String prefixIcon;
  final SvgPicture? suffixIcon;
  final String label;
  final void Function()? onTapSuffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputType,
    this.obscureText = false,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    required this.label,
    this.onTapSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      validator: validator ??
          (text) {
            if (text == null) {
              return StringsManager.basicValidationError.tr();
            } else {
              if (text.isEmpty) {
                return StringsManager.basicValidationError.tr();
              }
            }
          },
      style: getRegularStyle(
        color: ColorsManager.fontColor,
        fontSize: FontSize.s20.sp,
      ),
      decoration: InputDecoration(
        label: Text(
          label,
          style: getRegularStyle(
            color: ColorsManager.darkGrey,
            fontSize: FontSize.s16.sp,
          ),
        ).tr(),
        labelStyle: getRegularStyle(
          color: ColorsManager.darkGrey,
          fontSize: FontSize.s16.sp,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: AppSize.s2.r, color: ColorsManager.lightGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: AppSize.s2.r, color: ColorsManager.primary),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: AppSize.s2.r, color: ColorsManager.red),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: AppSize.s2.r, color: ColorsManager.red),
        ),
        prefixIcon: Container(
          padding: EdgeInsets.all(AppPadding.p12.r),
          child: SvgPicture.asset(
            prefixIcon,
            fit: BoxFit.cover,
            color: ColorsManager.darkGrey,
          ),
        ),
        suffixIcon: InkWell(
          onTap: onTapSuffixIcon,
          child: Container(
            width: AppSize.s20.w,
            height: AppSize.s20.h,
            padding: EdgeInsets.all(AppPadding.p12.r),
            child: suffixIcon,
          ),
        ),
      ),
    );
  }
}
