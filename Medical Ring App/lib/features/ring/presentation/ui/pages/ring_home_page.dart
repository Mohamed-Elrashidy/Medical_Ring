import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_ring_app/core/enums/size_enum.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/theming/my_app_colors.dart';
import 'package:medical_ring_app/core/theming/text_styles.dart';
import 'package:medical_ring_app/core/widgets/app_button.dart';
import 'package:medical_ring_app/core/widgets/horizontal_space.dart';
import 'package:medical_ring_app/core/widgets/ring_value_widget.dart';
import 'package:medical_ring_app/core/widgets/vertical_space.dart';
import 'package:medical_ring_app/features/ring/presentation/ui/widgets/ring_readings_table.dart';

import '../../../../../core/theming/app_locale.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../controller/ring_cubit.dart';

class RingHomePage extends StatelessWidget {
  const RingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RingCubit, RingState>(
        builder: (context, state) {
          return Stack(
            children: [
              _buildRingHomePage(context),
              if (state is RingLoading) const LoadingWidget() else Container()
            ],
          );
        },
      ),
    );
  }

  _buildRingHomePage(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${AppLocale.deviceNumber.translate} 12345678",
                      style: MyAppTextStyle.title),
                  Text("${AppLocale.userName.translate} محمد عماد ",
                      style: MyAppTextStyle.title),
                  const VerticalSpace(height: 16),
                  Text(AppLocale.currentValues.translate,
                      style: MyAppTextStyle.heading2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statusLegend(AppLocale.high.translate, Colors.red),
                      statusLegend(AppLocale.normal.translate, Colors.green),
                      statusLegend(AppLocale.low.translate, Colors.blue),
                    ],
                  ),
                  const VerticalSpace(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RingValueWidget(
                          color: Colors.red,
                          size: SizeEnum.large,
                          title: AppLocale.hr.translate,
                          value: 70.toString(),
                          iconPath: "assets/svg_images/heart.svg"),
                      RingValueWidget(
                          color: Colors.red,
                          size: SizeEnum.large,
                          title: AppLocale.hr.translate,
                          value: 70.toString(),
                          iconPath: "assets/svg_images/steps.svg"),
                    ],
                  ),
                  const VerticalSpace(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RingValueWidget(
                          color: Colors.red,
                          size: SizeEnum.large,
                          title: AppLocale.hr.translate,
                          value: 70.toString(),
                          iconPath: "assets/svg_images/oxygen.svg"),
                      RingValueWidget(
                          color: Colors.red,
                          size: SizeEnum.large,
                          title: AppLocale.hr.translate,
                          value: 70.toString(),
                          iconPath: "assets/svg_images/temp.svg"),
                    ],
                  ),
                  const VerticalSpace(height: 48),
                  Row(
                    children: [
                      Text(
                        AppLocale.previousValues.translate,
                        style: MyAppTextStyle.heading3,
                      ),
                      const Spacer(),
                      Text(
                        AppLocale.more.translate,
                        style: MyAppTextStyle.normalText.copyWith(
                          color: MyAppColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: MyAppColors.primary
                        ),
                      )
                    ],
                  ),
                  RingReadingsTable()
                ],
              ),
            )));
  }

  Widget statusLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const HorizontalSpace(width: 8),
        Text(text, style: MyAppTextStyle.normalText)
      ],
    );
  }
}
