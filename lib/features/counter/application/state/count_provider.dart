import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/counter/domain/repository/count_repository_provider.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';
import 'package:flutter_template/features/counter/domain/features/count_creator.dart';

/// countを保持するプロバイダー
final countProvider = FutureProvider.autoDispose<Count>(
  (ref) async {
    //repositoryからcountを取得する
    final Count? count = await ref.read(counterRepositoryProvider).fetch();

    //countが取得できない場合は初期値を生成する
    return count ?? CountCreator.create();
  },
);
