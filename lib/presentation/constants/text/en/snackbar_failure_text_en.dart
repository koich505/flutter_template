import 'package:flutter_template/domain/enum/error_message_type.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_failure_text.dart';

class SnackbarFailureTextEn implements SnackbarFailureText {
//snackbar
  @override
  String getMessage(ErrorMessageType errorMessageType) {
    switch (errorMessageType) {
      case ErrorMessageType.dataFetchFailed:
        return "Failed to fetch data";
      case ErrorMessageType.dataSaveFailed:
        return "Failed to save data";
      case ErrorMessageType.unknown:
        return "An unexpected error has occurred";
    }
  }
}
