import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

class SharedPreferencesStringConverter
    implements JsonConverter<String, Map<String, dynamic>> {
  const SharedPreferencesStringConverter();

  @override
  String fromJson(Map<String, dynamic> json) {
    final jsonString = jsonEncode(json).toString();
    return jsonString;
  }

  @override
  Map<String, dynamic> toJson(String sharedPreferencesString) {
    final map = json.decode(sharedPreferencesString) as Map<String, dynamic>;
    return map;
  }
}
