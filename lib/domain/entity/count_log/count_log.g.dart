// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountLogImpl _$$CountLogImplFromJson(Map<String, dynamic> json) =>
    _$CountLogImpl(
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
      previousValue: (json['previousValue'] as num).toInt(),
      newValue: (json['newValue'] as num).toInt(),
    );

Map<String, dynamic> _$$CountLogImplToJson(_$CountLogImpl instance) =>
    <String, dynamic>{
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'previousValue': instance.previousValue,
      'newValue': instance.newValue,
    };
