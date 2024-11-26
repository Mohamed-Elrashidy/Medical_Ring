import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/theming/app_locale.dart';
import 'package:medical_ring_app/core/theming/text_styles.dart';
import 'package:medical_ring_app/core/widgets/app_button.dart';
import 'package:medical_ring_app/core/widgets/loading_widget.dart';
import 'package:medical_ring_app/core/widgets/my_app_app_bar.dart';
import 'package:medical_ring_app/core/widgets/vertical_space.dart';
import 'package:medical_ring_app/features/home/presentation/ui/widgets/ring_overview_widget.dart';

import '../../controller/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            _buildHomePage(context),
            if (state is HomeLoading) const LoadingWidget() else Container()
          ],
        );
      },
    ));
  }

  Widget _buildHomePage(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppAppBar(
              title: "${AppLocale.welcome.translate}محمد  ", showBack: false),
          const VerticalSpace(height: 16),
          SizedBox(
            height: 650.h,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.7),
              children: [for (int i = 0; i < 20; i++) RingOverviewWidget()],
            ),
          ),
          Spacer(),
          AppButton(onTap: (){}, title: AppLocale.addDevice.translate)

        ],
      ),
    ));
  }
}
