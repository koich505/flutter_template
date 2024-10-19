import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/page/loading_page.dart';
import 'package:flutter_template/application/state/app_scaffold/theme_provider.dart';
import 'package:flutter_template/presentation/router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //router
    final router = ref.watch(goRouterProvider);
    //theme
    final ThemeData themeData = ref.read(themeProvider);

    return MaterialApp(
        //ページをタップするとfocusを外す
        home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            //loading画面をメインの画面に重ねる
            child: Stack(children: [
              MaterialApp.router(
                //以下の階層でthemeが適用される
                theme: themeData,
                routerConfig: router,
              ),
              const LoadingScreen(),
            ])));
  }
}
