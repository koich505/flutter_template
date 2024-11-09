import 'package:flutter/material.dart';
import 'package:flutter_template/domain/enum/brand_color_type.dart';

//アプリに適用されるthemeを定義するクラス
class AppTheme {
  AppTheme._();
  static ThemeData lightThemeData({required BrandColorType brandColorType}) {
    return ThemeData.light().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: brandColorType.color,
            foregroundColor: brandColorType.secondaryColor));
  }

  static ThemeData darkThemeData() {
    return ThemeData.dark().copyWith();
  }
}
