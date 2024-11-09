import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return MaterialApp(
        //ページをタップするとfocusを外す
        home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            //loading画面をメインの画面に重ねる
            child: Stack(children: [
              MaterialApp.router(
                theme: AppTheme.lightThemeData(),
                routerConfig: router,
              ),
              const LoadingScreen(),
            ])));
  }
}
