import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_constant.dart';

class AppController extends SuperController {
  Locale currentLocale = AppConstant.availableLocales[1];

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
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  updateLocale(Locale locale) {
    Get.updateLocale(locale);
    currentLocale = locale;
  }
}
