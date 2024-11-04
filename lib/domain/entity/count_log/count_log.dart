import 'package:flutter_template/domain/features/converter/datetime_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_log.freezed.dart';
part 'count_log.g.dart';

@freezed
abstract class CountLog implements _$CountLog {
  const factory CountLog({
    @DateTimeConverter() required DateTime createdAt,
    required int previousValue,
    required int newValue,
  }) = _CountLog;

  factory CountLog.fromJson(Map<String, dynamic> json) =>
      _$CountLogFromJson(json);
}
