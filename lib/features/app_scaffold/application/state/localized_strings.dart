import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/constants/text/en/localized_strings_en.dart';
import 'package:flutter_template/presentation/constants/text/interfaces/localized_strings.dart';
import 'package:flutter_template/presentation/constants/text/ja/localized_strings_ja.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localizedStringProvider = StateProvider<LocalizedStrings>((
  ref,
) {
  final Locale currentLocale =
      WidgetsBinding.instance.platformDispatcher.locale;

  final String lgCode = currentLocale.languageCode;
  switch (lgCode) {
    case 'ja':
      return LocalizedStringsJa();
    default:
      return LocalizedStringsEn();
  }
});
