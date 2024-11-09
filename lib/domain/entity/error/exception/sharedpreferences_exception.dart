import 'package:flutter_template/domain/entity/error/error_code/sharepreferences_error_code.dart';
import 'package:flutter_template/domain/entity/error/interface/custom_exception.dart';

class SharedpreferencesException extends CustomException {
  const SharedpreferencesException(
    SharedPreferencesErrorCode errorCode, {
    dynamic info,
  }) : super(errorCode, info: info);

  // factoryでエラーから生成する
  factory SharedpreferencesException.fromCode(String errorCode) {
    final sharedpreferencesErrorCode =
        SharedPreferencesErrorCode.fromCode(errorCode);
    // 取得に失敗した場合、一律システムエラーとする
    if (sharedpreferencesErrorCode == null) {
      throw const SharedpreferencesException(
          SharedPreferencesErrorCode.unknown);
    }
    return SharedpreferencesException(sharedpreferencesErrorCode);
  }
}
