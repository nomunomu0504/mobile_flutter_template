import 'package:flutter/material.dart';
import 'package:flutter_template/view/style/app_color.dart';

/// アプリで利用するタイポグラフィを定義
class AppTextStyle {
  /// bottomNavigation
  static const TextStyle bottomNavigationSelected = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: AppColor.primaryLight,
  );
  static const TextStyle bottomNavigationUnselected = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  /// For headline
  static const TextStyle headLine3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle headLine4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle headLine5 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  /// Other
  static const TextStyle placeHolder = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.textPlaceHolder,
  );
}
