import 'my_app_colors.dart';
import 'my_colors_handler.dart';

class ThemeColors {
  static MyColorsHandler textBlackWhite = MyColorsHandler(
      lightColor: MyAppColors.black, darkColor: MyAppColors.white);
  static MyColorsHandler scaffoldBackGroundColor = MyColorsHandler(
      lightColor: MyAppColors.lightScaffold, darkColor: MyAppColors.black);
  static MyColorsHandler textWhiteBlack = MyColorsHandler(
      lightColor: MyAppColors.white, darkColor: MyAppColors.black);
  static MyColorsHandler borderGreyDarkWhite = MyColorsHandler(
      lightColor: MyAppColors.grey, darkColor: MyAppColors.surfaceVariant);

  static MyColorsHandler textGreyDarkLight= MyColorsHandler(
      lightColor: MyAppColors.grey, darkColor: MyAppColors.surfaceVariant);
  static MyColorsHandler blueBorder = MyColorsHandler(
      lightColor: MyAppColors.primaryVariant, darkColor: MyAppColors.greyLightVariant);
  static MyColorsHandler bigContainer = MyColorsHandler(
      lightColor: MyAppColors.surface, darkColor: MyAppColors.grey);
  static MyColorsHandler smallContainer = MyColorsHandler(
      lightColor: MyAppColors.surface, darkColor: MyAppColors.greyLightVariant);
 static MyColorsHandler iconColors = MyColorsHandler(
      lightColor: MyAppColors.primary, darkColor: MyAppColors.darkWhite);
}
