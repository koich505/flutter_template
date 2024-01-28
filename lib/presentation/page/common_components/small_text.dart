import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/presentation/constants/brand_color.dart';
import 'package:flutter_template/presentation/constants/size.dart';

class SmallText extends StatelessWidget {
  final String text;
  const SmallText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: RawInt.p10.sp, color: BrandColor.subTextColor),
    );
  }
}
