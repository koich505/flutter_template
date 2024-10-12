// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountLog _$CountLogFromJson(Map<String, dynamic> json) {
  return _CountLog.fromJson(json);
}

/// @nodoc
mixin _$CountLog {
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get previousValue => throw _privateConstructorUsedError;
  int get newValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountLogCopyWith<CountLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountLogCopyWith<$Res> {
  factory $CountLogCopyWith(CountLog value, $Res Function(CountLog) then) =
      _$CountLogCopyWithImpl<$Res, CountLog>;
  @useResult
  $Res call({DateTime createdAt, int previousValue, int newValue});
}

/// @nodoc
class _$CountLogCopyWithImpl<$Res, $Val extends CountLog>
    implements $CountLogCopyWith<$Res> {
  _$CountLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? previousValue = null,
    Object? newValue = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      previousValue: null == previousValue
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as int,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountLogImplCopyWith<$Res>
    implements $CountLogCopyWith<$Res> {
  factory _$$CountLogImplCopyWith(
          _$CountLogImpl value, $Res Function(_$CountLogImpl) then) =
      __$$CountLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, int previousValue, int newValue});
}

/// @nodoc
class __$$CountLogImplCopyWithImpl<$Res>
    extends _$CountLogCopyWithImpl<$Res, _$CountLogImpl>
    implements _$$CountLogImplCopyWith<$Res> {
  __$$CountLogImplCopyWithImpl(
      _$CountLogImpl _value, $Res Function(_$CountLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? previousValue = null,
    Object? newValue = null,
  }) {
    return _then(_$CountLogImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      previousValue: null == previousValue
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as int,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountLogImpl implements _CountLog {
  const _$CountLogImpl(
      {required this.createdAt,
      required this.previousValue,
      required this.newValue});

  factory _$CountLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountLogImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final int previousValue;
  @override
  final int newValue;

  @override
  String toString() {
    return 'CountLog(createdAt: $createdAt, previousValue: $previousValue, newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountLogImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, createdAt, previousValue, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountLogImplCopyWith<_$CountLogImpl> get copyWith =>
      __$$CountLogImplCopyWithImpl<_$CountLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountLogImplToJson(
      this,
    );
  }
}

abstract class _CountLog implements CountLog {
  const factory _CountLog(
      {required final DateTime createdAt,
      required final int previousValue,
      required final int newValue}) = _$CountLogImpl;

  factory _CountLog.fromJson(Map<String, dynamic> json) =
      _$CountLogImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  int get previousValue;
  @override
  int get newValue;
  @override
  @JsonKey(ignore: true)
  _$$CountLogImplCopyWith<_$CountLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
