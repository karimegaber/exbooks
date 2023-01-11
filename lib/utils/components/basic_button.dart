import 'package:exbooks/utils/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class BasicButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool enabled;

  const BasicButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.enabled = true,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p12.h),
        child: TextWidget(
          text: label,
          textStyle: getBoldStyle(
            color: ColorsManager.background,
            fontSize: FontSize.s20.sp,
          ),
        ),
      ),
    );
  }
}
