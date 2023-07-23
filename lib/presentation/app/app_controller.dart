import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_constant.dart';
import '../../common/utils/app_log.dart';

class AppController extends SuperController {
  Locale currentLocale = AppConstant.availableLocales[1];

  @override
  void onInit() {
    AppLog.info("App controller init");
    super.onInit();
  }

  @override
  void onReady() {
    AppLog.info("App controller ready");

    super.onReady();
  }

  @override
  void onClose() {
    AppLog.info("App controller close");

    super.onClose();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    AppLog.info("App paused");
  }

  @override
  void onResumed() {
    AppLog.info("App resumed");
  }

  updateLocale(Locale locale) {
    Get.updateLocale(locale);
    currentLocale = locale;
  }
}
