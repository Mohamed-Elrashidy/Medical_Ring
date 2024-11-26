import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_ring_app/core/enums/size_enum.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/theming/my_app_colors.dart';
import 'package:medical_ring_app/core/theming/text_styles.dart';
import 'package:medical_ring_app/core/widgets/ring_value_widget.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_locale.dart';

class RingOverviewWidget extends StatelessWidget {
  const RingOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: (){
        context.pushNamed(Routes.ringHomePage);
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyAppColors.greyLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("محمد عماد", style: MyAppTextStyle.heading2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RingValueWidget(
                    size: SizeEnum.small,
                    title: AppLocale.hr.translate,
                    value: 70.toString(),
                    iconPath: "assets/icons/heart.svg"),
                RingValueWidget(
                    size: SizeEnum.small,
                    title: AppLocale.hr.translate,
                    value: 70.toString(),
                    iconPath: "assets/icons/heart.svg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RingValueWidget(
                    size: SizeEnum.small,
                    title: AppLocale.hr.translate,
                    value: 70.toString(),
                    iconPath: "assets/icons/heart.svg"),
                RingValueWidget(
                    size: SizeEnum.small,
                    title: AppLocale.hr.translate,
                    value: 70.toString(),
                    iconPath: "assets/icons/heart.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
