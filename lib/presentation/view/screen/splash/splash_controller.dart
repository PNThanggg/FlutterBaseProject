import 'package:flutter_base/common/extension/log_extension.dart';
import 'package:get/get.dart';

import '../../../route/app_route.dart';

class SplashController extends GetxController {
  RxString version = ''.obs;

  @override
  void onInit() {
    "Init splash".info();

    super.onInit();
  }

  @override
  void onReady() async {
    "Ready splash".info();

    super.onReady();

    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // version.value = packageInfo.version;

    await nextScreen();
  }

  @override
  void onClose() {
    "Close splash".info();

    super.onClose();
  }

  Future<void> nextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAndToNamed(AppRoute.homeScreen);
      },
    );
  }
}
