import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routing.dart';
import 'core/theming/app_locale.dart';
import 'core/theming/theming_bloc/themeing_cubit.dart';

class MedicalRingApp extends StatefulWidget {
  const MedicalRingApp({super.key});

  @override
  State<MedicalRingApp> createState() => _MedicalRingAppState();
}

class _MedicalRingAppState extends State<MedicalRingApp> {
  @override
  void initState() {
    BlocProvider.of<ThemingCubit>(context).localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('ar', AppLocale.AR),
      ],
      initLanguageCode: 'ar',
    );
    BlocProvider.of<ThemingCubit>(context).localization.onTranslatedLanguage =
        BlocProvider.of<ThemingCubit>(context).onTranslatedLanguage;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemingCubit, ThemeingState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            locale: BlocProvider.of<ThemingCubit>(context).localization.currentLocale,
            supportedLocales: BlocProvider.of<ThemingCubit>(context).localization.supportedLocales,
            localizationsDelegates: BlocProvider.of<ThemingCubit>(context).localization.localizationsDelegates,
            title: 'Medical Ring App',
            theme: BlocProvider.of<ThemingCubit>(context).getTheme(),
             onGenerateRoute: Routing.onGenerateRoute,
          ),

        );

      });
  }
}
