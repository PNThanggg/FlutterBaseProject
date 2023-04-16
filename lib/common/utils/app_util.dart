import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../build_constants.dart';
import '../../presentation/base/app_controller.dart';
import '../../presentation/view/resources/app_color.dart';

log(String text) {
  if (BuildConstants.currentEnvironment != Environment.prod) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
  }
}

String chooseContentByLanguage(String enContent, String viContent) {
  if (Get.find<AppController>().currentLocale.toLanguageTag() == 'vi-VN' && viContent.isNotEmpty) {
    return viContent;
  }
  return enContent.isNotEmpty ? enContent : viContent;
}

String capitalizeOnlyFirstLater(String originalText) {
  if (originalText.trim().isEmpty) return "";
  return "${originalText[0].toUpperCase()}${originalText.substring(1)}";
}

showToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: AppColor.black.withOpacity(0.9),
    textColor: AppColor.white,
    fontSize: 18.0.sp,
  );
}

hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<dynamic> parseJsonFromAsset(String assetPath) async {
  debugPrint("Loading from $assetPath");
  final stringData = await rootBundle.loadString(assetPath);
  return jsonDecode(stringData);
}

bool isNullEmpty(Object? o) => o == null || "" == o || o == "null";

bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object? o) => o == null || false == o || 0 == o || "" == o || "0" == o;

bool isNullEmptyList<T>(List<T>? t) => t == null || [] == t || t.isEmpty;

bool isNullEmptyMap<T>(Map<T, T>? t) => t == null || {} == t || t.isEmpty;

bool isNumeric(dynamic s) {
  String sConvert = s.toString();
  if (isNullEmpty(sConvert)) {
    return false;
  }
  return (double.tryParse(sConvert) != null || int.tryParse(sConvert) != null);
}
