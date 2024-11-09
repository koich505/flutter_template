import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/domain/repository/ad/interstitial_ad_repository.dart';
import 'package:flutter_template/infrastructure/constants/repository_constants.dart';
import 'package:flutter_template/infrastructure/helper/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

//実行環境のrepository
class PrdInterstitialAdRepository
    with RepositoryConstants
    implements InterstitialAdRepository {
  //sharedPreferencesのインスタンスを取得する
  Future<SharedPreferences> get _pref async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }

  //sharedPreferencesに保存する際のkey
  String get key => sharedPreferencesKeys.showInterstitialKey;

  final int maxFailedLoadAttempts = 3;

  @override
  Future<InterstitialAd?> fetchAdInstance() async {
    final String adId = AdHelper.interstitialAdUnitId;
    int numOfAttemptLoad = 0;
    InterstitialAd? result;

    //広告読み込みが終了したら処理を抜けたい
    final Completer<InterstitialAd?> completer = Completer();

    await InterstitialAd.load(
      adUnitId: adId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // 広告が正常にロードされたときに呼ばれる
        onAdLoaded: (InterstitialAd ad) {
          debugPrint('add loaded');
          //広告の挙動を設定
          numOfAttemptLoad = 0;
          result = ad;
          completer.complete(result); // 完了を通知
        },
        // 広告のロードが失敗した際に呼ばれる
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("ad failed to load $numOfAttemptLoad");
          debugPrint(error.message);
          numOfAttemptLoad += 1;
          if (numOfAttemptLoad < maxFailedLoadAttempts) {
            fetchAdInstance();
          } else {
            completer.complete(null); // 失敗時はnullを返す
          }
        },
      ),
    );
    //広告が読み込まれたら or 失敗したら処理を抜ける
    return await completer.future;
  }

  @override
  Future<int?> fetchShowAdCount() async {
    final pref = await _pref;

    final int? countString = pref.getInt(key);

    //sharedPreferencesに値が保存されてい無い場合nullを返し処理を終了
    return countString;
  }

  @override
  Future<void> setShowAdCount({required int newShowAdCount}) async {
    final pref = await _pref;
    //保存
    await pref.setInt(key, newShowAdCount);
  }
}
