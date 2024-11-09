import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/presentation/constants/brand_color.dart';
import 'package:flutter_template/presentation/constants/size.dart';

class MainTextStyle {
  static final xl = _textStyle(SizePoint.d40.sp);
  static final l = _textStyle(SizePoint.d28.sp);
  static final m = _textStyle(SizePoint.d20.sp);
  static final s = _textStyle(SizePoint.d16.sp);
  static final xs = _textStyle(SizePoint.d8.sp);

  static TextStyle _textStyle(double fontSize) => TextStyle(
        fontSize: fontSize,
        color: BrandColor.mainTextColor,
      );
}

class SubTextStyle {
  static final xl = _textStyle(SizePoint.d40.sp);
  static final l = _textStyle(SizePoint.d28.sp);
  static final m = _textStyle(SizePoint.d20.sp);
  static final s = _textStyle(SizePoint.d16.sp);
  static final xs = _textStyle(SizePoint.d8.sp);

  static TextStyle _textStyle(double fontSize) => TextStyle(
        fontSize: fontSize,
        color: BrandColor.subTextColor,
      );
}
