import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/application/state/app_scaffold/localized_strings.dart';
import 'package:flutter_template/application/mixin/presentation_mixin.dart';
import 'package:flutter_template/application/usecase/ad/ad_usecase.dart';
import 'package:flutter_template/application/usecase/counter/counter_usecase.dart';
import 'package:flutter_template/domain/entity/count/count.dart';

//押すとカウントを増やすボタン
class CountUpFloatingActionButton extends ConsumerWidget
    with PresentationMixin {
  final Count count;
  const CountUpFloatingActionButton({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //言語ファイル
    final localizedStrings = ref.watch(localizedStringProvider);

    return FloatingActionButton(
      onPressed: () async {
        //mixinのexecuteを使ってカウントを増やす処理を実行する
        execute(context, action: () async {
          await ref.read(counterUsecaseProvider).countUp(count: count);
          await ref.read(adUsecaseProvider).callInterstitialAdProcess();
        },
            //成功時のメッセージ
            //失敗時のメッセージはrepositoryのAppExeptionから渡ってくる
            successMessage: localizedStrings.snackbarSuccess.countSaveSuccess);
      },
      tooltip: localizedStrings.toolTip.floatingActionButtonTooltip,
      child: const Icon(Icons.add),
    );
  }
}
