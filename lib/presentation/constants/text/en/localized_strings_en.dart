import 'package:flutter_template/presentation/constants/text/en/counter_page_text_en.dart';
import 'package:flutter_template/presentation/constants/text/en/snackbar_failure_text_en.dart';
import 'package:flutter_template/presentation/constants/text/en/snackbar_success_text_en.dart';
import 'package:flutter_template/presentation/constants/text/en/tool_tip_text_en.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/counter_page_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/localized_strings.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_failure_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/tool_tip_text.dart';

class LocalizedStringsEn implements LocalizedStrings {
  @override
  final CounterPageText counterPage = CounterPageTextEn();
  @override
  final SnackbarSuccessText snackbarSuccess = SnackbarSuccessTextEn();
  @override
  final SnackbarFailureText snackbarFailure = SnackbarFailureTextEn();
  @override
  final ToolTipText toolTip = ToolTipTextEn();
}
