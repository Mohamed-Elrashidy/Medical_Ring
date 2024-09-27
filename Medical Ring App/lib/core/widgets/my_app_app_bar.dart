import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_ring_app/core/theming/theming_bloc/themeing_cubit.dart';

import '../theming/my_app_icons.dart';
import '../theming/text_styles.dart';

import 'horizontal_space.dart';

class MyAppAppBar extends StatelessWidget {
  MyAppAppBar({required this.title, super.key});
  String title;
  late ThemingCubit themingCubit;
  @override
  Widget build(BuildContext context) {
    themingCubit = BlocProvider.of<ThemingCubit>(context);
    return Row(children: [
      // rotate 180 degree if the language is arabic
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(themingCubit.isArabic() ? 3.14 : 0),
        child: SvgPicture.asset(
          MyAppIcons.backIcon.icon,
          width: 14.w,
          height: 14.h,
        ),
      ),
      const HorizontalSpace(width: 16),
      Text(
        title,
        style: MyAppTextStyle.title,
      ),
    ]);
  }
}
