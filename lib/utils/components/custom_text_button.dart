import 'package:exbooks/resources/colors_manager.dart';
import 'package:exbooks/resources/fonts_manager.dart';
import 'package:exbooks/resources/styles_manager.dart';
import 'package:exbooks/utils/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final Color fontColor;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.fontSize = FontSize.s16,
    this.fontColor = ColorsManager.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: TextWidget(
        text: text,
        textStyle: getRegularStyle(
          color: fontColor,
          fontSize: fontSize.sp,
        ),
      ),
    );
  }
}
