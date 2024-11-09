import 'package:collection/collection.dart';
import 'package:flutter_template/domain/entity/error/interface/error_code.dart';
import 'package:flutter_template/domain/enum/error_message_type.dart';

/// サーバー共通エラーコード
enum SharedPreferencesErrorCode implements ErrorCode {
  dataSaveError(
    '',
    'データの保存に失敗',
    ErrorMessageType.dataSaveFailed,
  ),
  dataFetchError(
    '',
    'データの取得に失敗',
    ErrorMessageType.dataFetchFailed,
  ),
  unknown(
    '',
    '予期せぬエラー',
    ErrorMessageType.unknown,
  );

  const SharedPreferencesErrorCode(
    this._errorCode,
    this._errorTitle,
    this._errorMessageType,
  );

  final String _errorCode;
  final String _errorTitle;
  final ErrorMessageType _errorMessageType;

  @override
  String get code => _errorCode;

  @override
  String get title => _errorTitle;

  @override
  ErrorMessageType get errorMessageType => _errorMessageType;

  static SharedPreferencesErrorCode? fromCode(String errorCode) =>
      values.firstWhereOrNull((element) => element.code == errorCode);
}
