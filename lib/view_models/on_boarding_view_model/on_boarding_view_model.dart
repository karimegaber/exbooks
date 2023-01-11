import 'package:exbooks/models/on_boarding_model.dart';
import 'package:exbooks/resources/constants_manager.dart';
import 'package:exbooks/resources/strings_manager.dart';
import 'package:exbooks/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';
import '../../services/local/cache_helper.dart';

class OnBoardingViewModel {
  /// [ Variables ]
  final PageController pageController = PageController();
  int currentIndex = 1;
  List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
      title: StringsManager.onBoardingTitle1,
      description: StringsManager.onBoardingDescription1,
      imagePath: assetsGetter(assetName: 'on_boarding_1.jpg'),
    ),
    OnBoardingModel(
      title: StringsManager.onBoardingTitle2,
      description: StringsManager.onBoardingDescription2,
      imagePath: assetsGetter(assetName: 'on_boarding_2.jpg'),
    ),
    OnBoardingModel(
      title: StringsManager.onBoardingTitle3,
      description: StringsManager.onBoardingDescription3,
      imagePath: assetsGetter(assetName: 'on_boarding_3.jpg'),
    ),
  ];

  /// [ Methods ]

  void onNextTap(PageController pageController, BuildContext context) {
    if (currentIndex < onBoardingData.length) {
      currentIndex = currentIndex + 1;
      pageController.animateToPage(
        currentIndex - 1,
        duration: const Duration(
            milliseconds: ConstantsManager.onBoardingScreenDuration),
        curve: Curves.easeInOutCubic,
      );
    } else {
      onDone(context);
    }
  }

  onSkip(context) async {
    await CacheHelper.insertData(
            key: ConstantsManager.onBoardingSkippedKey, value: true)
        .then((value) async {
      await handleLoginWithToken(context);
    });
  }

  void onDone(BuildContext context) async {
    await CacheHelper.insertData(
            key: ConstantsManager.onBoardingSkippedKey, value: true)
        .then((value) async {
      await handleLoginWithToken(context);
    });
  }

  handleLoginWithToken(context) async {
    if (await CacheHelper.getData(key: ConstantsManager.tokenKey) != null) {
      token = CacheHelper.getData(key: ConstantsManager.tokenKey);
      Navigator.pushReplacementNamed(context, Routes.layoutScreenRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginScreenRoute);
    }
  }

  onPageChanged(index) {
    currentIndex = index + 1;
  }
}
