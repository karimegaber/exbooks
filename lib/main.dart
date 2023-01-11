import 'package:easy_localization/easy_localization.dart';
import 'package:exbooks/resources/language_manager.dart';
import 'package:exbooks/services/local/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        ARABIC_LOCAL,
        ENGLISH_LOCAL,
      ],
      path: LOCALIZATION_PATH,
      child: Phoenix(
        child: const MyApp(),
      ),
    ),
  );
}
