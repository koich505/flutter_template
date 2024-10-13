import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/common_utils/run_usecase_mixin.dart';
import 'package:flutter_template/features/count_log/domain/features/count_log_creator.dart';
import 'package:flutter_template/features/count_log/application/state/count_log/count_log_provider.dart';
import 'package:flutter_template/features/counter/application/state/count/count_provider.dart';
import 'package:flutter_template/features/counter/domain/repository/count_repository_provider.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';
import 'package:flutter_template/features/counter/domain/features/count_updater.dart';
import 'package:flutter_template/features/common_utils/page_state/overlay_loading.dart';

final counterUsecaseProvider =
    Provider.autoDispose<CounterUsecase>(CounterUsecase.new);

class CounterUsecase with RunUsecaseMixin {
  final Ref _ref;
  CounterUsecase(
    this._ref,
  );
  CounterRepository get _counterRepository =>
      _ref.read(counterRepositoryProvider);

  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);

  //providerの初期化(再読み込み)
  void _invalidateCountProvider() => _ref.invalidate(countProvider);

  //実行されるとcountを1増やし、repositoryに保存する
  Future<void> countUp({required Count count}) async {
    await execute(
        //loadingControllerを渡しているため、実行中はローディング表示される
        loadingController: _loadingController,
        action: () async {
          final previousValue = count.value;
          final newValue = previousValue + 1;
          //valueを更新したCountを作成
          final newCount =
              CountUpdator.update(count: count, newValue: newValue);

          //1秒待つ
          await Future.delayed(const Duration(seconds: 1));

          //値を更新したCountを保存
          await _ref.read(counterRepositoryProvider).saveCount(newCount);

          //countLogを作成
          final countLog = CountLogCreator.create(
              previousValue: previousValue, newValue: newValue);

          //notifierを更新
          await _ref
              .read(countLogListProvider.notifier)
              .addCountLog(countLog: countLog);
        });
    //countProviderを更新
    _invalidateCountProvider();
  }

  Future<void> save({required Count count}) async {
    await execute(
        //loadingControllerを渡しているため、実行中はローディング表示される
        loadingController: _loadingController,
        action: () async {
          //1秒待つ
          await Future.delayed(const Duration(seconds: 1));
          //countを保存
          _counterRepository.saveCount(count);
        });
  }
}
