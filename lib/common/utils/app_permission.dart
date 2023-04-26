import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../presentation/view/base/screen_util/flutter_screenutil.dart';
import '../../presentation/view/resources/app_color.dart';
import '../../presentation/view/widget/app_touchable.dart';
import 'app_util.dart';

class AppPermission {
  static Future<PermissionStatus> checkPermission(BuildContext context, Permission permission,
      String messageDenied, String messageDeniedNeedSetting,
      {Function()? onGrant,
      Function()? onDenied,
      Function()? onOther,
      bool showErrorDialog = true}) async {
    final status = await permission.request();

    if (status.isGranted) {
      if (onGrant != null) {
        onGrant();
      }
    } else if (status.isDenied) {
      if (onDenied != null) {
        onDenied();
      }
      if (showErrorDialog) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(chooseContentByLanguage("Notice", "Thông báo")),
                content: Text(messageDenied),
                actions: [
                  AppTouchable(
                    onPressed: Get.back,
                    padding: EdgeInsets.symmetric(vertical: 4.0.sp, horizontal: 8.0.sp),
                    child: Text(
                      chooseContentByLanguage("Close", "Đóng"),
                      style: TextStyle(
                        color: AppColor.black.withOpacity(0.6),
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppTouchable(
                    onPressed: () {
                      Get.back();
                      checkPermission(context, permission, messageDenied, messageDeniedNeedSetting,
                          onGrant: onGrant, onDenied: onDenied, onOther: onOther);
                    },
                    padding: EdgeInsets.symmetric(vertical: 4.0.sp, horizontal: 8.0.sp),
                    child: Text(
                      chooseContentByLanguage("Continue", "Tiếp tục"),
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            });
      }
    } else {
      if (onOther != null) {
        onOther();
      }
      if (showErrorDialog) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(chooseContentByLanguage("Notice", "Thông báo")),
                content: Text(messageDeniedNeedSetting),
                actions: [
                  AppTouchable(
                    onPressed: Get.back,
                    padding: EdgeInsets.symmetric(vertical: 4.0.sp, horizontal: 8.0.sp),
                    child: Text(
                      chooseContentByLanguage("Close", "Đóng"),
                      style: TextStyle(
                        color: AppColor.black.withOpacity(0.6),
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppTouchable(
                    onPressed: () {
                      Get.back();
                      openAppSettings();
                    },
                    padding: EdgeInsets.symmetric(vertical: 4.0.sp, horizontal: 8.0.sp),
                    child: Text(
                      chooseContentByLanguage("Setting", "Cài đặt"),
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            });
      }
    }
    return status;
  }
}
