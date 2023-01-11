import 'package:exbooks/models/google_user_model.dart';
import 'package:exbooks/resources/routes_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../resources/constants_manager.dart';
import '../../services/local/cache_helper.dart';
import '../../utils/components/loading_indicator.dart';

class LoginViewModel {
  // Text Fields Variables
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static late GoogleUserModel user;

  // Password visibility state
  bool passwordVisibility = true;

  // Change Password visibility state
  void changePasswordVisibilityState() {
    passwordVisibility = !passwordVisibility;
  }

  // Login with email and password
  void loginWithEmailAndPassword() {
    if (formKey.currentState!.validate()) {
      print('OKAY');
    } else {
      print('Not Good!');
    }
  }

  // Login as guest
  void loginAsGuest({
    required BuildContext context,
  }) async {
    showLoadingIndicator(context);
    await _auth.signInAnonymously().then(
      (value) {
        if (value.user != null) {
          Navigator.of(context).pop();
          print('Token = ${value.user!.uid}');
          Navigator.of(context).pushReplacementNamed(Routes.layoutScreenRoute);
        } else {
          print('User is not found!');
        }
      },
    );
  }

  // Login with Google
  void loginWithGoogle({
    required BuildContext context,
  }) async {
    showLoadingIndicator(context);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    if (googleUser != null && googleAuth != null) {
      user = GoogleUserModel(
        id: googleUser.id,
        name: googleUser.displayName!,
        email: googleUser.email,
        imageUrl: googleUser.photoUrl!,
        serverAuthCode: googleUser.serverAuthCode!,
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );
      await CacheHelper.insertData(
              key: ConstantsManager.tokenKey, value: user.accessToken)
          .then(
        (value) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(Routes.layoutScreenRoute);
          print('-----------------------> USER INFO <-----------------------');
          print('ID : ${user.id}');
          print('Name : ${user.name}');
          print('Email : ${user.email}');
          print('Photo Url : ${user.imageUrl}');
          print('Server Auth Code : ${user.serverAuthCode}');
          print('Token = ${user.accessToken}');
          print('ID Token = ${user.idToken}');
          print('-----------------------------------------------------------');
        },
      );
    } else {
      print('User Error!');
    }
  }

  // Login with Facebook
  void loginWithFacebook() {}

  // Login with Apple
  void loginWithApple() {}

  // Navigate to register
  void navigateToRegister({
    required BuildContext context,
  }) {
    Navigator.of(context).pushNamed(Routes.registerScreenRoute);
  }
}
