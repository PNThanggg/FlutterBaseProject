import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'build_constants.dart';
import 'common/utils/app_notification_local.dart';
import 'data/local/database_helper.dart';
import 'data/local/share_preference_utils.dart';
import 'presentation/base/app_binding.dart';
import 'presentation/route/app_page.dart';
import 'presentation/route/app_route.dart';
import 'presentation/view/base/screen_util/flutter_screenutil.dart';
import 'presentation/view/resources/app_color.dart';

void main() {
  BuildConstants.setEnvironment(Environment.dev);
  mainDelegate();
}

void mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferenceUtils.init();
  await DatabaseHelper().init();
  AppNotificationLocal.initNotificationLocal();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBinding(),
        initialRoute: AppRoute.splashScreen,
        defaultTransition: Transition.fade,
        getPages: AppPage.pages,
        theme: ThemeData(
          primaryColor: AppColor.white,
          fontFamily: 'SF-Compact-Rounded',
          textSelectionTheme:
              const TextSelectionThemeData(selectionHandleColor: Colors.transparent),
        ),
      ),
    ),
  );
}
