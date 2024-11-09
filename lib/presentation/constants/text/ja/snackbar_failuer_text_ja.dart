import 'package:flutter_template/domain/enum/error_message_type.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_failure_text.dart';

class SnackbarFailureTextJa implements SnackbarFailureText {
//snackbar
  @override
  String getMessage(ErrorMessageType errorMessageType) {
    switch (errorMessageType) {
      case ErrorMessageType.dataFetchFailed:
        return "データの取得に失敗しました";
      case ErrorMessageType.dataSaveFailed:
        return "データの保存に失敗しました";
      case ErrorMessageType.unknown:
        return "予期せぬエラーが発生しました";
    }
  }
}
