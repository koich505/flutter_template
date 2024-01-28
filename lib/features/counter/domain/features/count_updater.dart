import 'package:flutter_template/features/counter/domain/entity/count.dart';

class CountUpdator {
  /// updatedAtをかならず現在時刻で更新するために更新時は必ずこのクラスから生成する
  static Count update({
    required Count count,
    int? newValue,
  }) {
    final DateTime now = DateTime.now();
    final Count newCount = count.copyWith(
      updatedAt: now,
      value: newValue ?? count.value,
    );
    return newCount;
  }
}
