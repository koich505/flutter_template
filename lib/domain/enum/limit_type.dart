enum LimitType {
  showInterstitialAd,
}

extension LimitTypeExtLimit on LimitType {
  int get limit {
    switch (this) {
      case LimitType.showInterstitialAd:
        return 3;
    }
  }
}

extension LimitTypeExtUpdateStep on LimitType {
  int get updateStep {
    switch (this) {
      case LimitType.showInterstitialAd:
        return 1;
    }
  }
}
