import 'package:flutter_template/domain/entity/error/interface/error_code.dart';

abstract class CustomException implements Exception {
  const CustomException(
    this.errorCode, {
    this.info,
  });

  final ErrorCode errorCode;
  final dynamic info;

  @override
  String toString() {
    return 'CustomException{errorCode: ${errorCode.code}, title: ${errorCode.title}, info: $info}';
  }
}
