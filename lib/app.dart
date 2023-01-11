import 'package:easy_localization/easy_localization.dart';
import 'package:exbooks/resources/constants_manager.dart';
import 'package:exbooks/resources/routes_manager.dart';
import 'package:exbooks/resources/themes_manager.dart';
import 'package:exbooks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    getLocal().then((local) => context.setLocale(local));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        ConstantsManager.appScreenWidth,
        ConstantsManager.appScreenHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: ConstantsManager.appName,
          debugShowCheckedModeBanner: false,
          theme: appLightTheme(),
          darkTheme: appDarkTheme(),
          initialRoute: Routes.splashScreenRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }
}
