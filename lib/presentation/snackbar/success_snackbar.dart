import 'package:flutter/material.dart';

/// 処理成功用スナックバー
class SuccessSnackBar extends SnackBar {
  SuccessSnackBar._({required String message})
      : super(
          content: Text(message),
          backgroundColor: Colors.greenAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );

  static void show(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(SuccessSnackBar._(message: message));
  }
}
