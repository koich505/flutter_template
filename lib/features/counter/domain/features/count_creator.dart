import 'package:flutter_template/features/counter/domain/entity/count.dart';

/// countを生成する
/// updatedAtをかならず現在時刻で作成するためにインスタンス生成時は必ずこのクラスから生成する
class CountCreator {
  static Count create() {
    final DateTime now = DateTime.now();
    final Count count = Count(
      updatedAt: now,
      value: 0,
    );
    return count;
  }
}
