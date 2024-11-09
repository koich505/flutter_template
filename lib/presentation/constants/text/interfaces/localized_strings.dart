import 'package:flutter_template/presentation/constants/text/interfaces/counter_page_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_failure_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/tool_tip_text.dart';

abstract interface class LocalizedStrings {
  CounterPageText get counterPage;
  SnackbarSuccessText get snackbarSuccess;
  SnackbarFailureText get snackbarFailure;
  ToolTipText get toolTip;
}
