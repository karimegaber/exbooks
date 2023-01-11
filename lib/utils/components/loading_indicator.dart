import 'package:exbooks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/values_manager.dart';

showLoadingIndicator(context) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      children: [
        Container(
          width: AppSize.s50.w,
          height: AppSize.s50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12.r),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s12.r),
              child: Image.asset(
                assetsGetter(assetName: 'loading_book.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
