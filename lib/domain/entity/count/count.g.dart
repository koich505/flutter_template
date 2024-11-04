// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountImpl _$$CountImplFromJson(Map<String, dynamic> json) => _$CountImpl(
      updatedAt: json['updatedAt'],
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$CountImplToJson(_$CountImpl instance) =>
    <String, dynamic>{
      'updatedAt': instance.updatedAt,
      'value': instance.value,
    };
