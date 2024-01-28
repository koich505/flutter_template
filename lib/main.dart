import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/presentation/provider_overrides.dart';
import 'package:flutter_template/presentation/router/app.dart';

void main() {
  Widget app = ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return const MyApp();
    },
  );

  runApp(ProviderScope(overrides: prdProviderOverrides, child: app));
}
