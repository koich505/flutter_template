import 'package:flutter/material.dart';

enum BrandColorType {
  blue,
}

extension BrandColorExtColor on BrandColorType {
  Color get color {
    switch (this) {
      case BrandColorType.blue:
        return Colors.blue;
    }
  }
}

extension LimitTypeExtUpdateStep on BrandColorType {
  Color get secondaryColor {
    switch (this) {
      case BrandColorType.blue:
        return Colors.yellow;
    }
  }
}
