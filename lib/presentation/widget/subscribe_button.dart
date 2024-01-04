import 'package:flutter/material.dart';

import '../../../res/image/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image_widget.dart';
import 'app_touchable.dart';

class SubscribeButton extends StatelessWidget {
  final bool isPremiumFull;
  final Function()? onPressed;

  const SubscribeButton({super.key, required this.isPremiumFull, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (isPremiumFull) {
      return const SizedBox.shrink();
    } else {
      return AppTouchable(
        onPressed: onPressed,
        child: AppImageWidget.asset(
          path: AppImage.animationPremium,
          width: 40.0.sp,
          height: 40.0.sp,
        ),
      );
    }
  }
}
