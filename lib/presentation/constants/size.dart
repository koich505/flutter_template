import 'package:flutter/material.dart';

/// 値の意味を含まないサイズ一覧定義
class SizePoint {
  SizePoint._();
  static const d0 = 0.0;
  static const d4 = 4.0;
  static const d8 = 8.0;

  static const d12 = 12.0;
  static const d16 = 16.0;
  static const d20 = 20.0;
  static const d24 = 24.0;

  static const d28 = 28.0;
  static const d32 = 32.0;

  static const d40 = 40.0;
  static const d48 = 48.0;
  static const d56 = 56.0;
  static const d64 = 64.0;
  static const d72 = 72.0;
  static const d80 = 80.0;
  static const d88 = 88.0;
  static const d96 = 96.0;
  static const d104 = 104.0;
  static const d112 = 112.0;
  static const d120 = 120.0;
  static const d128 = 128.0;
  static const d136 = 136.0;
  static const d144 = 144.0;
  static const d152 = 152.0;
  static const d160 = 160.0;
  static const d168 = 168.0;
  static const d176 = 176.0;
  static const d184 = 184.0;
  static const d192 = 192.0;
  static const d200 = 200.0;

  static displayHeightHalf(BuildContext context) =>
      MediaQuery.of(context).size.height / 2;

  static displayHeightFull(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static displayWidthHalf(BuildContext context) =>
      MediaQuery.of(context).size.width / 2;

  static displayWidthFull(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
