// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountImpl _$$CountImplFromJson(Map<String, dynamic> json) => _$CountImpl(
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as String),
      value: const IntConverter().fromJson(json['value'] as String),
    );

Map<String, dynamic> _$$CountImplToJson(_$CountImpl instance) =>
    <String, dynamic>{
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
      'value': const IntConverter().toJson(instance.value),
    };
