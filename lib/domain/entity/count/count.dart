import 'package:flutter_template/domain/features/converter/datetime_converter.dart';
import 'package:flutter_template/domain/features/converter/int_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'count.freezed.dart';
part 'count.g.dart';

@freezed
abstract class Count implements _$Count {
  const factory Count({
    @DateTimeConverter() required DateTime updatedAt,
    @IntConverter() required int value,
  }) = _Count;

  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);
}
