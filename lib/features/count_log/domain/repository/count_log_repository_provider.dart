import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';

final countLogRepositoryProvider = Provider<CountLogRepository>(
  (_) => throw UnimplementedError(),
);

abstract interface class CountLogRepository {
  //保存したcountを取得する
  Future<Count?> fetch();

  //countを保存する
  Future<void> saveCountLog(Count count);
}
