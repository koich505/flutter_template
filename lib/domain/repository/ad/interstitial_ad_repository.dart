import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//
final interStitialAdRepositoryProvider = Provider<InterstitialAdRepository>(
  (_) => throw UnimplementedError(),
);

abstract interface class InterstitialAdRepository {
  //interstitialAdのインスタンスを取得
  Future<InterstitialAd?> fetchAdInstance();

  Future<int?> fetchShowAdCount();

  Future<void> setShowAdCount({required int newShowAdCount});
}
