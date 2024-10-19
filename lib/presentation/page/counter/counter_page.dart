import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/application/state/app_scaffold/localized_strings.dart';
import 'package:flutter_template/application/state/count/count_provider.dart';
import 'package:flutter_template/presentation/constants/size.dart';
import 'package:flutter_template/presentation/page/common_components/big_text.dart';
import 'package:flutter_template/presentation/page/common_components/gap.dart';
import 'package:flutter_template/presentation/page/common_components/small_text.dart';
import 'package:flutter_template/presentation/page/counter/components/count_up_floating_action_button.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //providerの初期化
    //言語ファイル
    final localizedStrings = ref.watch(localizedStringProvider);

    final count = ref.watch(countProvider);

    return count.when(
      data: (count) => Scaffold(
          appBar: AppBar(
            title: Text(localizedStrings.counterPage.counterPageTitle),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BigText(
                    text: localizedStrings.counterPage.countUpDescriptionText),
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
      error: (error, stackTrace) =>
          Center(child: Text(localizedStrings.counterPage.errorText)),
    );
  }
}
