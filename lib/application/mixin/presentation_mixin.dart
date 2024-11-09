import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entity/error/interface/custom_exception.dart';
import 'package:flutter_template/presentation/constants/text/app_strings.dart';
import 'package:flutter_template/presentation/snackbar/failure_snackbar.dart';
import 'package:flutter_template/presentation/snackbar/success_snackbar.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin PresentationMixin {
  Future<void> execute(
    BuildContext context, {
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final localizedStrings = appStrings();

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      //actionを実行した後に成功した場合は、SuccessSnackBarを表示する
      SuccessSnackBar.show(
        scaffoldMessenger,
        message: successMessage,
      );
    } on CustomException catch (e) {
      //失敗した場合は、FailureSnackBarを表示する
      FailureSnackBar.show(
        scaffoldMessenger,
        message: localizedStrings.snackbarFailure
            .getMessage(e.errorCode.errorMessageType),
      );
    }
  }
}
