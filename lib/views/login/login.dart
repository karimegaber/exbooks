import 'package:easy_localization/easy_localization.dart';
import 'package:exbooks/resources/colors_manager.dart';
import 'package:exbooks/resources/strings_manager.dart';
import 'package:exbooks/resources/styles_manager.dart';
import 'package:exbooks/resources/values_manager.dart';
import 'package:exbooks/utils/components/basic_button.dart';
import 'package:exbooks/utils/components/custom_text_button.dart';
import 'package:exbooks/utils/components/cutsom_text_field.dart';
import 'package:exbooks/utils/components/social_login_item.dart';
import 'package:exbooks/utils/components/text_widget.dart';
import 'package:exbooks/view_models/login_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/utils.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LoginViewModel _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSize.s20.r),
            child: SingleChildScrollView(
              child: Form(
                key: _viewModel.formKey,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Center(
                      child: SvgPicture.asset(
                        assetsGetter(assetName: 'login.svg', icon: true),
                        width: double.infinity,
                        height: AppSize.s200.h,
                      ),
                    ),

                    SizedBox(height: AppSize.s20.h),

                    // Email Address
                    CustomTextField(
                      controller: _viewModel.emailController,
                      inputType: TextInputType.text,
                      prefixIcon: assetsGetter(assetName: 'at.svg', icon: true),
                      label: StringsManager.loginEmailOrUsername.tr(),
                    ),

                    SizedBox(height: AppSize.s12.h),

                    // Password
                    StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return CustomTextField(
                          controller: _viewModel.passwordController,
                          inputType: TextInputType.text,
                          prefixIcon:
                              assetsGetter(assetName: 'lock.svg', icon: true),
                          label: StringsManager.password.tr(),
                          obscureText: _viewModel.passwordVisibility,
                          suffixIcon: _viewModel.passwordVisibility
                              ? SvgPicture.asset(assetsGetter(
                                  assetName: 'visibility.svg', icon: true))
                              : SvgPicture.asset(assetsGetter(
                                  assetName: 'visibility_off.svg', icon: true)),
                          onTapSuffixIcon: () {
                            setState(() {
                              _viewModel.changePasswordVisibilityState();
                            });
                          },
                        );
                      },
                    ),

                    SizedBox(height: AppSize.s30.h),

                    // Login
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: AppSize.s40.w),
                      child: BasicButton(
                        label: StringsManager.login.tr(),
                        onPressed: () {
                          _viewModel.loginWithEmailAndPassword();
                        },
                      ),
                    ),

                    SizedBox(height: AppSize.s12.h),

                    Center(
                      child: CustomTextButton(
                        onPressed: () {
                          _viewModel.loginAsGuest(context: context);
                        },
                        text: StringsManager.loginAsGuest.tr(),
                        fontColor: ColorsManager.primary,
                      ),
                    ),

                    SizedBox(height: AppSize.s20.h),

                    // Login with...
                    Center(
                      child: TextWidget(
                        text: StringsManager.loginOptionsText.tr(),
                        textStyle: getLightStyle(
                          color: ColorsManager.fontColor,
                          fontSize: AppSize.s16.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: AppSize.s20.h),

                    // Social Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialLoginItem(
                          icon: 'google.svg',
                          onPressed: () {
                            _viewModel.loginWithGoogle(context: context);
                          },
                        ),
                        SocialLoginItem(
                          icon: 'facebook.svg',
                          onPressed: () {
                            _viewModel.loginWithFacebook();
                          },
                        ),
                        SocialLoginItem(
                          icon: 'apple.svg',
                          onPressed: () {
                            _viewModel.loginWithApple();
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.s20.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: StringsManager.donNotHaveAnAccount.tr(),
                          textStyle: getLightStyle(
                            color: ColorsManager.fontColor,
                            fontSize: AppSize.s16.sp,
                          ),
                        ),
                        //SizedBox(width: AppSize.s8.w,),
                        CustomTextButton(
                          onPressed: () {
                            _viewModel.navigateToRegister(context: context);
                          },
                          text: StringsManager.register.tr(),
                          fontColor: ColorsManager.primary,
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.s20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
