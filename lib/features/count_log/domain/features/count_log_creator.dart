import 'package:flutter_template/features/count_log/domain/entity/count_log.dart';

/// countを生成する
/// updatedAtをかならず現在時刻で作成するためにインスタンス生成時は必ずこのクラスから生成する
class CountLogCreator {
  static CountLog create({required int previousValue, required int newValue}) {
    final DateTime now = DateTime.now();
    final CountLog countLog = CountLog(
      createdAt: now,
      previousValue: previousValue,
      newValue: newValue,
    );
    return countLog;
  }
}
