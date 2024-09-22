import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/my_app_colors.dart';
import '../theming/text_styles.dart';
class SecondaryAppButton extends StatelessWidget {
  SecondaryAppButton(
      {required this.onTap,
      required this.title,
      this.width,
      this.borderRadius,
      super.key});
  void Function() onTap;
  String title;
  double? width;
  double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: MyAppColors.white,
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 8.r),
        ),
        width: width?.w ?? double.infinity,
        alignment: Alignment.center,
        child: Text(title,
            style: MyAppTextStyle.reverseTitle
                .copyWith(color: MyAppColors.primary)),
      ),
    );
  }
}
