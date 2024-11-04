import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/presentation/router/app.dart';
import 'package:flutter_template/provider_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebaseの初期化
  //await Firebase.initializeApp(
  //options: DefaultFirebaseOptions.currentPlatform,
  //);

  Widget app = ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return const MyApp();
    },
  );
  final overrides = await PrdProviderOverrides().getPrdOverrides();

  runApp(ProviderScope(overrides: overrides, child: app));
}
