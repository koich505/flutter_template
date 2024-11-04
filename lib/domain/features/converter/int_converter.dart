import 'package:freezed_annotation/freezed_annotation.dart';

class IntConverter implements JsonConverter<int, String> {
  const IntConverter();

  @override
  int fromJson(String intString) {
    return int.parse(intString);
  }

  @override
  String toJson(int int) {
    return int.toString();
  }
}
