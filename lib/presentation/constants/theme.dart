import 'package:flutter/material.dart';

//アプリに適用されるthemeを定義するクラス
class AppTheme {
  AppTheme._();
  static ThemeData lightThemeData() {
    return ThemeData.light().copyWith();
  }

  static ThemeData darkThemeData() {
    return ThemeData.dark().copyWith();
  }
}
