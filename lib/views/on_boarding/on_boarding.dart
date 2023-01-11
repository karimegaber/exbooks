import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:exbooks/utils/components/basic_button.dart';
import 'package:exbooks/utils/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../utils/utils.dart';
import '../../view_models/on_boarding_view_model/on_boarding_view_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: ColorsManager.background,
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p12.w,
                  vertical: AppPadding.p12.w,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Text(
                      StringsManager.skip.tr(),
                      style: getBoldStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSize.s14.sp,
                      ),
                    ),
                    onPressed: () {
                      _viewModel.onSkip(context);
                    },
                  ),
                ),
              ),

              // Pages
              Expanded(
                child: PageView.builder(
                  controller: _viewModel.pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: ScreenUtil.defaultSize.height / 2,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p12.w),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorsManager.primary)),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              _viewModel.onBoardingData[index].imagePath,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s20.h,
                        ),

                        // Title
                        TextWidget(
                          text: _viewModel.onBoardingData[index].title,
                          textStyle: getBoldStyle(
                            color: ColorsManager.primary,
                            fontSize: FontSize.s20.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(
                          height: AppSize.s8.h,
                        ),

                        // Description
                        TextWidget(
                          text: _viewModel.onBoardingData[index].description,
                          textStyle: getBoldStyle(
                            color: ColorsManager.fontColor,
                            fontSize: FontSize.s14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                  itemCount: _viewModel.onBoardingData.length,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _viewModel.onPageChanged(index);
                    });
                  },
                ),
              ),

              _viewModel.currentIndex < _viewModel.onBoardingData.length
                  ? Row(
                      children: [
                        Expanded(
                          child: DotsIndicator(
                            dotsCount: _viewModel.onBoardingData.length,
                            position: _viewModel.currentIndex.toDouble() - 1,
                            decorator: const DotsDecorator(
                              color:
                                  ColorsManager.lightPrimary, // Inactive color
                              activeColor: ColorsManager.fontColor,
                            ),
                          ),
                        ),
                        // Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _viewModel.onNextTap(
                                  _viewModel.pageController, context);
                            },
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: TextWidget(
                                text: StringsManager.next.tr(),
                                textStyle: getMediumStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSize.s20.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: BasicButton(
                        label: StringsManager.getStarted.tr(),
                        onPressed: () {
                          _viewModel.onDone(context);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
