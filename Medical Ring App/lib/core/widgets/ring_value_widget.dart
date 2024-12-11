import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_ring_app/core/enums/size_enum.dart';
import 'package:medical_ring_app/core/theming/my_app_colors.dart';
import 'package:medical_ring_app/core/theming/text_styles.dart';

class RingValueWidget extends StatelessWidget {
  RingValueWidget(
      {super.key,
      required this.size,
      required this.title,
      required this.value,
      this.color = MyAppColors.white,
      required this.iconPath});
  SizeEnum size;
  String title;
  String value;
  String iconPath;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (size == SizeEnum.small) ? 70 : 130,
      height: (size == SizeEnum.small) ? 95 : 170,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: MyAppTextStyle.heading3,
          ),
          SvgPicture.asset(
            iconPath,
            width: 30.w,
            height: 30.h,
          ),
          Text(
            value,
            style: MyAppTextStyle.heading3,
          ),
        ],
      ),
    );
  }
}
