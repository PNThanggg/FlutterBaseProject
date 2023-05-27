import 'package:get/get.dart';

class SplashController extends GetxController {
  RxString version = ''.obs;

  @override
  void onReady() async {
    super.onReady();

    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // version.value = packageInfo.version;
  }
}
