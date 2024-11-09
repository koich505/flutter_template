import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/application/state/app_scaffold/brand_color/brand_color_provider.dart';
import 'package:flutter_template/presentation/constants/theme.dart';
import 'package:flutter_template/presentation/page/loading_screen.dart';
import 'package:flutter_template/presentation/router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //router
    final router = ref.watch(goRouterProvider);
    final brandColorType = ref.watch(brandColorProvider);

    return MaterialApp(
        //ページをタップするとfocusを外す
        home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            //loading画面をメインの画面に重ねる
            child: Stack(children: [
              brandColorType.when(
                data: (data) {
                  return MaterialApp.router(
                    theme: AppTheme.lightThemeData(brandColorType: data),
                    routerConfig: router,
                  );
                },
                error: (error, stackTrace) {
                  return Container();
                },
                loading: () => Container(
                    color: Colors.white,
                    height: double.infinity,
                    width: double.infinity,
                    child: Container()),
              ),
              const LoadingScreen(),
            ])));
  }
}
