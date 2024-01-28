/// presentation層からpushNamedでページ遷移するために使用するenum
enum PageId {
  home,
}

/// 設計上の画面パス
extension PagePath on PageId {
  String get path {
    switch (this) {
      case PageId.home:
        return '/';
    }
  }
}

/// 設計上の画面名
extension PageName on PageId {
  String get routeName {
    switch (this) {
      case PageId.home:
        return 'home';
    }
  }
}
