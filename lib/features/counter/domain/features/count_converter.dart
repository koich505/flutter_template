import 'dart:convert';

import 'package:flutter_template/features/counter/domain/entity/count.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//countを変換するメソッドを持ったクラス
class CountConverter implements JsonConverter<Count, Map<String, dynamic>> {
  const CountConverter();

  @override
  Count fromJson(Map<String, dynamic> json) {
    return Count(
        updatedAt: DateTime.parse(json['updatedAt']),
        value: int.parse(json['value']));
  }

  //sharedPreferencesから取得したStringをCountに変換する
  Count fromSharedPreferencesString({required String countString}) {
    final memoMap = json.decode(countString) as Map<String, dynamic>;
    return Count(
        updatedAt: DateTime.parse(memoMap['updatedAt']),
        value: int.parse(memoMap['value']));
  }

  //CountをsharedPreferencesに保存するためにStringに変換する
  static String toSharedPreferencesString({required Count count}) {
    Map<String, dynamic> dataMapEntry =
        count.toJson().map((key, value) => MapEntry(key, value.toString()));
    final countString = jsonEncode(dataMapEntry).toString();
    return countString;
  }

  @override
  Map<String, dynamic> toJson(Count data) => data.toJson();
}
