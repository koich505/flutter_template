import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdHelper {
  static bool isRelease() {
    return const bool.fromEnvironment('dart.vm.product');
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return isRelease()
          ? '<YOUR_ANDROID_BANNER_AD_UNIT_ID>'
          //リリースモードでない場合、テスト広告のIDを返却
          : 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return isRelease()
          ? '<YOUR_IOS_BANNER_AD_UNIT_ID>'
          //リリースモードでない場合、テスト広告のIDを返却
          : 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return isRelease()
          ? dotenv.get("INTERSTITIAL_AD_ANDROID_UNIT_ID")
          //リリースモードでない場合、テスト広告のIDを返却
          : "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return isRelease()
          ? dotenv.get("INTERSTITIAL_AD_IOS_UNIT_ID")
          //リリースモードでない場合、テスト広告のIDを返却
          : "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return isRelease()
          ? dotenv.get("REWARDED_AD_ANDROID_UNIT_ID")
          //リリースモードでない場合、テスト広告のIDを返却
          : "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return isRelease()
          ? dotenv.get("REWARDED_AD_IOS_UNIT_ID")
          //リリースモードでない場合、テスト広告のIDを返却
          : "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
