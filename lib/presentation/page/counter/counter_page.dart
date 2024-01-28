import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/features/counter/application/state/count_provider.dart';
import 'package:flutter_template/presentation/constants/size.dart';
import 'package:flutter_template/presentation/page/common_components/big_text.dart';
import 'package:flutter_template/presentation/page/common_components/gap.dart';
import 'package:flutter_template/presentation/page/common_components/small_text.dart';
import 'package:flutter_template/presentation/page/counter/components/count_up_floating_action_button.dart';
import 'package:flutter_template/presentation/page/counter/text/page_text.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //providerの初期化
    final count = ref.watch(countProvider);

    return count.when(
      data: (count) => Scaffold(
          appBar: AppBar(
            title: const Text(counterPageTitle),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const BigText(text: countUpDescriptionText),
                //BigTextとSmallTextの縦の隙間を埋めるwidget
                Gap.h(RawInt.p32.h),
                SmallText(text: count.value.toString()),
              ],
            ),
          ),
          //countを増やすボタン
          floatingActionButton: CountUpFloatingActionButton(
            count: count,
          )),
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, stackTrace) => const Center(child: Text(errorText)),
    );
  }
}
