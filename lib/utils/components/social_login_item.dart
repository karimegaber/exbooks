import 'package:exbooks/resources/colors_manager.dart';
import 'package:exbooks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/values_manager.dart';

class SocialLoginItem extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const SocialLoginItem(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: AppSize.s40.h,
        width: AppSize.s100.w,
        padding: EdgeInsets.all(AppPadding.p8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
          border: Border.all(color: ColorsManager.lightGrey),
        ),
        child: SvgPicture.asset(
          assetsGetter(assetName: icon, icon: true),
        ),
      ),
    );
  }
}
