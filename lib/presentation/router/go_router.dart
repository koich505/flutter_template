import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/page/counter/counter_page.dart';
import 'package:flutter_template/presentation/router/page_path.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider(
  (ref) {
    // GoRouterの設定
    final routes = [
      GoRoute(
        path: PageId.home.path,
        name: PageId.home.routeName,
        builder: (context, state) {
          return const CounterPage();
        },
      ),
    ];

    return GoRouter(
      initialLocation: PageId.home.path,
      debugLogDiagnostics: false,
      routes: routes,
    );
  },
);
