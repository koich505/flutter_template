import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/common_utils/page_state/overlay_loading.dart';
import 'package:flutter_template/presentation/constants/brand_color.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(overlayLoadingProvider);

    //loadingの状態がtrueの場合のみインジケーターを表示する
    return isLoading
        ? Container(
            decoration: const BoxDecoration(color: BrandColor.loadingBgColor),
            child: const Center(
              child: CircularProgressIndicator(
                color: BrandColor.mainColor,
              ),
            ))
        : Container();
  }
}
