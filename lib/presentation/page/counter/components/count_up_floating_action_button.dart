import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/app_scaffold/application/state/localized_strings.dart';
import 'package:flutter_template/features/common_utils/presentation_mixin.dart';
import 'package:flutter_template/features/counter/application/usecase/counter_usecase.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';

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
        },
            //成功時のメッセージ
            //失敗時のメッセージはrepositoryのAppExeptionから渡ってくる
            successMessage: localizedStrings.snackbar.countSaveSuccess);
      },
      tooltip: localizedStrings.toolTip.floatingActionButtonTooltip,
      child: const Icon(Icons.add),
    );
  }
}
