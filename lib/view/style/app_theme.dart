import 'package:flutter/material.dart';
import 'package:flutter_template/view/style/app_text_style.dart';

import 'app_color.dart';

class AppTheme {
  static final themeData = ThemeData(
    brightness: Brightness.light, // NOTE: ダークモード強制OFF
    canvasColor: Colors.transparent,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.backgroundPrimary,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedIconTheme: IconThemeData(
        color: AppColor.primary,
      ),
      selectedItemColor: AppColor.primary,
      selectedLabelStyle: AppTextStyle.bottomNavigationSelected,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: AppTextStyle.bottomNavigationUnselected,
    ),
    iconTheme: const IconThemeData(color: AppColor.primary),
    primaryIconTheme: const IconThemeData(
      color: AppColor.primary,
      size: 24.0,
    ),
    fontFamily: 'Hiragino Kaku Gothic ProN',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundPrimary,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColor.primary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: AppColor.backgroundPrimary,
    ),
    buttonTheme: const ButtonThemeData(
      disabledColor: AppColor.grey03,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.primary;
        }
        return AppColor.grey02;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.primary;
        }
        return AppColor.grey02;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color?>(AppColor.primary),
      fillColor: MaterialStateProperty.all<Color?>(Colors.black),
      side: MaterialStateBorderSide.resolveWith((states) {
        return const BorderSide(color: AppColor.primary);
      }),
    ),
  );
}
