import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entity/count_log/count_log.dart';

//
final countLogRepositoryProvider = Provider<CountLogRepository>(
  (_) => throw UnimplementedError(),
);

abstract interface class CountLogRepository {
  //保存したcountLogをリストで取得
  Future<List<CountLog>> fetch();

  //countLogを保存
  Future<void> add(CountLog countLog);
}
