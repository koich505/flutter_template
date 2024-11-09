import 'package:flutter_template/domain/enum/error_message_type.dart';

abstract interface class SnackbarFailureText {
  String getMessage(ErrorMessageType errorMessageType);
}
