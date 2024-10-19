import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
mixin RunUsecaseMixin {
  Future<T> execute<T>({
    //通常はoverlayLoadingProviderを指定する
    StateController<bool>? loadingController,
    //usecaseで実行する処理を指定する
    required Future<T> Function() action,
  }) async {
    //loadingontrollerが渡されているかを判定
    final disableLoading = loadingController == null;

    //loadingControllerが渡されていない場合
    if (disableLoading) {
      try {
        //actionを実行して処理を終了
        return await action();
      } catch (e) {
        //actionでエラーが発生した場合は、そのままrethrow
        //presentation層でMixinを利用hしている場合、そちらでエラーハンドリング(snackbarの表示含む)を行う
        rethrow;
      }
    }

    //loadingControllerが渡されている場合
    //loadingControllerをtrueにする
    //app.dartでstackされているLoadingScreen()が表示される
    loadingController.update((_) => true);
    try {
      //actionを実行
      return await action();
    } catch (e) {
      //actionでエラーが発生した場合は、そのままrethrow
      //presentation層でMixinを利用hしている場合、そちらでエラーハンドリング(snackbarの表示含む)を行う
      rethrow;
      //actionの成否にかかわらずloadingControllerをfalseにする
    } finally {
      loadingController.update((_) => false);
    }
  }
}
