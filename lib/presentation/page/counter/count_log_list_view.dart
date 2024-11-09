import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/application/state/count_log/count_log_provider.dart';
import 'package:flutter_template/presentation/constants/text/app_strings.dart';
import 'package:flutter_template/presentation/page/counter/count_log_tile.dart';

class CountLogListView extends ConsumerWidget {
  const CountLogListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //providerの初期化
    //言語ファイル
    final localizedStrings = appStrings();
    final countLogList = ref.watch(countLogListProvider);

    return countLogList.when(
      data: (countLog) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: countLog.length,
            itemBuilder: (context, index) {
              final log = countLog[index];
              return CountLogTile(countLog: log);
            });
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, stackTrace) =>
          Center(child: Text(localizedStrings.counterPage.errorText)),
    );
  }
}
