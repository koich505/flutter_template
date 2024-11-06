import 'package:flutter_template/domain/entity/count_log/count_log.dart';
import 'package:flutter_template/domain/repository/count_log/count_log_repository_provider.dart';
import 'package:flutter_template/infrastructure/constants/counter_repository_constants.dart';
import 'package:flutter_template/infrastructure/constants/repository_constants.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

//実行環境のrepository
//操作対象のdbのインスタンスを外から注入
class PrdCounterLogRepository
    with RepositoryConstants
    implements CountLogRepository {
  final Database db;
  PrdCounterLogRepository(
    this.db,
  );

  //sharedPreferencesに保存する際のkey
  String get key => CounterConstants().countKey;

  @override
  Future<List<CountLog>> fetch() async {
    // memoIdをキーにsqliteからmemoを取得
    final List<Map<String, dynamic>> response = await db.query(
      countLogConstants.localTableName,
    );
    final countLog = response.map((countLogMap) {
      return CountLog.fromJson(countLogMap);
    }).toList();

    return countLog;
  }

  @override
  Future<void> add(CountLog countLog) async {
    final countLogMap = countLog.toJson();
    //保存

    await db.insert(
      countLogConstants.localTableName,
      countLogMap,
    );
  }
}
