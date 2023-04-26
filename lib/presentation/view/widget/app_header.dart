import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/base/screen_util/flutter_screenutil.dart';
import '../resources/app_color.dart';
import 'app_touchable.dart';

class AppHeader extends StatelessWidget {
  final String? title;
  final String? hintContent;
  final String? hintTitle;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Widget? middleWidget;
  final Widget? extendWidget;
  final CrossAxisAlignment? crossAxisAlignmentMainRow;

  const AppHeader({
    Key? key,
    this.title,
    this.leftWidget,
    this.rightWidget,
    this.middleWidget,
    this.extendWidget,
    this.crossAxisAlignmentMainRow,
    this.hintContent,
    this.hintTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).padding.top + 16.0.sp, 0.0, 16.0.sp),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
            child: Row(
              crossAxisAlignment: crossAxisAlignmentMainRow ?? CrossAxisAlignment.center,
              children: [
                leftWidget ??
                    AppTouchable(
                      width: 40.0.sp,
                      height: 40.0.sp,
                      padding: EdgeInsets.all(2.0.sp),
                      onPressed: Get.back,
                      outlinedBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0.sp),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                Expanded(
                  child: middleWidget ??
                      Text(
                        title ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.grayText,
                        ),
                      ),
                ),
                rightWidget ?? SizedBox(width: 40.0.sp),
              ],
            ),
          ),
          extendWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
