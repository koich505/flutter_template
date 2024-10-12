// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountLogImpl _$$CountLogImplFromJson(Map<String, dynamic> json) =>
    _$CountLogImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      previousValue: json['previousValue'] as int,
      newValue: json['newValue'] as int,
    );

Map<String, dynamic> _$$CountLogImplToJson(_$CountLogImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'previousValue': instance.previousValue,
      'newValue': instance.newValue,
    };
