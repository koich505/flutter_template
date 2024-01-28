import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/constants/theme.dart';

//アプリに適用されるthemeを保持するプロバイダー
final themeProvider =
    StateProvider<ThemeData>((ref) => AppTheme.lightThemeData());
