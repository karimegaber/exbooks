// Get the asset directly
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:exbooks/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../services/local/cache_helper.dart';

String? token;

String assetsGetter({
  required String assetName,
  bool icon = false,
}) {
  if (icon) {
    return 'assets/images/icons/$assetName';
  } else {
    return 'assets/images/$assetName';
  }
}

// Exit dialog pop up
Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringsManager.exitMessage.tr(),
                style: getBoldStyle(
                    color: ColorsManager.red, fontSize: FontSize.s20.sp),
              ),
              SizedBox(height: AppSize.s20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorsManager.red,
                      ),
                      child: Text(
                        StringsManager.confirm.tr(),
                        style: getRegularStyle(
                            color: ColorsManager.white,
                            fontSize: FontSize.s16.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.s16.h),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      StringsManager.cancel.tr(),
                      style: getRegularStyle(
                          color: ColorsManager.black,
                          fontSize: FontSize.s16.sp),
                    ),
                  ))
                ],
              ),
              SizedBox(height: AppSize.s20.h),
            ],
          ),
        );
      });
}

// Get App language
Future<String> getAppLanguage() async {
  String? language = CacheHelper.getData(key: ConstantsManager.languageKey);

  if (language != null && language.isNotEmpty) {
    return language;
  } else {
    return LanguageType.ENGLISH.getValue();
    //return LanguageType.ARABIC.getValue();
  }
}

// Set app language
Future<void> changeAppLanguage() async {
  String currentLanguage = await getAppLanguage();

  if (currentLanguage == LanguageType.ARABIC.getValue()) {
    CacheHelper.insertData(
      key: ConstantsManager.languageKey,
      value: LanguageType.ENGLISH.getValue(),
    );
  } else {
    CacheHelper.insertData(
      key: ConstantsManager.languageKey,
      value: LanguageType.ARABIC.getValue(),
    );
  }
}

Future<Locale> getLocal() async {
  String currentLanguage = await getAppLanguage();

  if (currentLanguage == LanguageType.ARABIC.getValue()) {
    return ARABIC_LOCAL;
  } else {
    return ENGLISH_LOCAL;
  }
}

handleLanguageChange(context) {
  changeAppLanguage();
  Phoenix.rebirth(context);
}
