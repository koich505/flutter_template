import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/application/mixin/run_usecase_mixin.dart';
import 'package:flutter_template/application/state/ad/interstitial/show_ad_count_provider.dart';
import 'package:flutter_template/application/state/app_scaffold/overlay_loading.dart';
import 'package:flutter_template/domain/enum/limit_type.dart';
import 'package:flutter_template/domain/repository/ad/interstitial_ad_repository.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final adUsecaseProvider = Provider.autoDispose<AdUsecase>(AdUsecase.new);

class AdUsecase with RunUsecaseMixin {
  final Ref _ref;
  AdUsecase(
    this._ref,
  );
  InterstitialAdRepository get _interstitialAdRepository =>
      _ref.read(interStitialAdRepositoryProvider);

  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);

  //providerの初期化
  void _invalidateShowAdCountProvider() => _ref.invalidate(showAdCountProvider);

  Future<void> callInterstitialAdProcess() async {
    await execute(
        //loadingControllerを渡しているため、実行中はローディング表示される
        loadingController: _loadingController,
        action: () async {
          final showAdCount = await _ref.read(showAdCountProvider.future);

          //広告表示までのリミットに達したかどうか
          final isLimit = LimitType.showInterstitialAd.limit <=
              showAdCount + LimitType.showInterstitialAd.updateStep;

          //showAdCountを更新
          //広告表示までのリミットに達している場合、0を
          //達していない場合現在のshowAdCountにupdateStepを足して保存
          final newShowAdCount = isLimit
              ? 0
              : showAdCount + LimitType.showInterstitialAd.updateStep;

          //repositoryに保存
          await _interstitialAdRepository.setShowAdCount(
              newShowAdCount: newShowAdCount);

          //providerを更新
          _invalidateShowAdCountProvider();

          //広告表示までのリミットに達している場合広告を表示
          if (isLimit) await showInterstitialAd();
        });
  }

  Future<void> showInterstitialAd() async {
    //広告を取得
    final ad =
        await _ref.read(interStitialAdRepositoryProvider).fetchAdInstance();

    //広告が取得できなかった場合、何もせずに終了
    if (ad == null) return;

    //広告が閉じられたら関数を抜ける
    final Completer<void> completer = Completer();

    //取得した広告にコールバックを設定
    ad.fullScreenContentCallback = FullScreenContentCallback(
        //広告が表示された時の挙動
        onAdShowedFullScreenContent: (InterstitialAd ad) {
      debugPrint("ad onAdshowedFullscreen");
    },
        //広告が閉じられた時の挙動
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
      debugPrint("ad Disposed");
      ad.dispose();
      completer.complete();
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
      debugPrint('$ad OnAdFailed $aderror');
      ad.dispose();
      completer.complete();
    });

    //広告を表示
    await ad.show();
    //広告が閉じられたら or 失敗したら処理を抜ける
    return await completer.future;
  }
}
