import 'package:flutter_template/presentation/constants/text/interfaces/counter_page_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/snackbar_text.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/tool_tip_text.dart';

abstract interface class LocalizedStrings {
  CounterPageText get counterPage;
  SnackbarText get snackbar;
  ToolTipText get toolTip;
}
