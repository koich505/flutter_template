import 'package:flutter_template/domain/enum/error_message_type.dart';

abstract class ErrorCode {
  const ErrorCode();

  String get code;

  String get title;

  ErrorMessageType get errorMessageType;
}
