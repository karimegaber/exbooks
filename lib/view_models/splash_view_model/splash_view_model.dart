import 'package:flutter/material.dart';

import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';
import '../../services/local/cache_helper.dart';
import '../../utils/utils.dart';

class SplashViewModel {
  void start(BuildContext context) async {
    await getAppLanguage().then((value) async {
      if (await CacheHelper.getData(
              key: ConstantsManager.onBoardingSkippedKey) ??
          false) {
        if (await CacheHelper.getData(key: ConstantsManager.tokenKey) != null) {
          token = CacheHelper.getData(key: ConstantsManager.tokenKey);
          Navigator.pushReplacementNamed(context, Routes.layoutScreenRoute);
        } else {
          Navigator.pushReplacementNamed(context, Routes.loginScreenRoute);
        }
      } else {
        // On Boarding [ NOT ] Skipped.
        Navigator.of(context)
            .pushReplacementNamed(Routes.onBoardingScreenRoute);
      }
    });
  }
}
