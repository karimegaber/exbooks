import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../utils/utils.dart';
import '../../view_models/splash_view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _viewModel = SplashViewModel();

  @override
  void initState() {
    _viewModel.start(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: ColorsManager.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.s100.h,
              ),
              Center(child: Image.asset(assetsGetter(assetName: 'logo.png'), height: AppSize.s250.w, width: AppSize.s250.h,)),
              SizedBox(
                height: AppSize.s100.h,
              ),
              const CircularProgressIndicator(
                color: ColorsManager.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}