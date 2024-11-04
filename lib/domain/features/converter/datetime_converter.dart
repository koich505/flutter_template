import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String dateTimeString) {
    return DateTime.parse(dateTimeString);
  }

  @override
  String toJson(DateTime dateTime) {
    return dateTime.toString();
  }
}
