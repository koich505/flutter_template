import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/application/state/count/count_provider.dart';
import 'package:flutter_template/presentation/constants/size.dart';
import 'package:flutter_template/presentation/constants/text/app_strings.dart';
import 'package:flutter_template/presentation/constants/text_style/main_text_style.dart';
import 'package:flutter_template/presentation/page/common_components/gap.dart';
import 'package:flutter_template/presentation/page/counter/components/count_up_floating_action_button.dart';
import 'package:flutter_template/presentation/page/counter/count_log_list_view.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //providerの初期化
    //言語ファイル
    final localizedStrings = appStrings();

    final count = ref.watch(countProvider);

    return count.when(
      data: (count) => Scaffold(
          appBar: AppBar(
            title: Text(localizedStrings.counterPage.counterPageTitle),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  localizedStrings.counterPage.countUpDescriptionText,
                  style: MainTextStyle.m,
                ),
                //BigTextとSmallTextの縦の隙間を埋めるwidget
                Gap.h(SizePoint.d32.h),
                Text(
                  count.value.toString(),
                  style: MainTextStyle.l,
                ),
                SizedBox(
                    height: SizePoint.displayHeightHalf(context),
                    child: const CountLogListView()),
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
