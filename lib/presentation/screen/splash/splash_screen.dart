import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view/widget/app_container.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Splash screen",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              controller.version.value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
