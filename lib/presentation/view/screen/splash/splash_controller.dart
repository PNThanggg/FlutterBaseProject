import 'package:get/get.dart';

import '../../../../common/utils/app_log.dart';
import '../../../routers/app_route.dart';

class SplashController extends GetxController {
  RxString version = ''.obs;

  @override
  void onInit() {
    AppLog.info("Init splash");

    super.onInit();
  }

  @override
  void onReady() async {
    AppLog.info("Ready splash");

    super.onReady();

    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // version.value = packageInfo.version;

    await nextScreen();
  }

  @override
  void onClose() {
    AppLog.info("Close splash");

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
