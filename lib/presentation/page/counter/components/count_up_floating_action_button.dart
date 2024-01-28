import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/common_utils/presentation_mixin.dart';
import 'package:flutter_template/features/counter/application/usecase/counter_usecase.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';
import 'package:flutter_template/presentation/page/counter/text/page_text.dart';

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
    return FloatingActionButton(
      onPressed: () async {
        //mixinのexecuteを使ってカウントを増やす処理を実行する
        execute(context, action: () async {
          await ref.read(counterUsecaseProvider).countUp(count: count);
        },
            //成功時のメッセージ
            //失敗時のメッセージはrepositoryのAppExeptionから渡ってくる
            successMessage: countSaveSuccess);
      },
      tooltip: floatingActionButtonTooltip,
      child: const Icon(Icons.add),
    );
  }
}
