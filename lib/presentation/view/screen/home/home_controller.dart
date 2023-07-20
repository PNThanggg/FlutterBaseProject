import 'package:get/get.dart';

import '../../../../common/utils/app_log.dart';

class HomeController extends GetxController {
  /// It is called immediately after the widget is allocated memory.
  @override
  void onInit() {
    AppLog.info("Init home");

    super.onInit();
  }

  /// It is called immediately after the widget is rendered on screen.
  @override
  void onReady() {
    AppLog.info("Ready home");

    super.onReady();
  }

  /// It is called just before the controller is deleted from memory.
  @override
  void onClose() {
    AppLog.info("Close home");

    super.onClose();
  }
}