import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entity/count/count.dart';

//
final counterRepositoryProvider = Provider<CounterRepository>(
  (_) => throw UnimplementedError(),
);

abstract interface class CounterRepository {
  //保存したcountを取得する
  Future<Count?> fetch();

  //countを保存する
  Future<void> saveCount(Count count);
}
