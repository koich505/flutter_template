import 'package:flutter_template/presentation/constants/text/interfaces/counter_page_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/localized_strings.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_failure_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/tool_tip_text.dart';
import 'package:flutter_template/presentation/constants/text/ja/counter_page_text_ja.dart';
import 'package:flutter_template/presentation/constants/text/ja/snackbar_failuer_text_ja.dart';
import 'package:flutter_template/presentation/constants/text/ja/snackbar_success_text_ja.dart';
import 'package:flutter_template/presentation/constants/text/ja/tool_tip_text_ja.dart';

class LocalizedStringsJa implements LocalizedStrings {
  @override
  final CounterPageText counterPage = CounterPageTextJa();
  @override
  final SnackbarSuccessText snackbarSuccess = SnackbarSuccessTextJa();
  @override
  final SnackbarFailureText snackbarFailure = SnackbarFailureTextJa();
  @override
  final ToolTipText toolTip = ToolTipTextJa();
}
