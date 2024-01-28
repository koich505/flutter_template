import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/common_utils/run_usecase_mixin.dart';
import 'package:flutter_template/features/counter/application/state/count_provider.dart';
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
          //valueを更新したCountを作成
          final newCount =
              CountUpdator.update(count: count, newValue: count.value + 1);

          //1秒待つ
          await Future.delayed(const Duration(seconds: 1));

          //値を更新したCountを保存
          await _ref.read(counterRepositoryProvider).saveCount(newCount);
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
