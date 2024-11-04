import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/enum/environment_enum.dart';
import 'package:flutter_template/domain/repository/count/count_log_repository_provider.dart';
import 'package:flutter_template/domain/repository/count/counter_repository_provider.dart';
import 'package:flutter_template/infrastructure/mock/mock_count_repository.dart';
import 'package:flutter_template/infrastructure/prd/prd_count_log_repository.dart';
import 'package:flutter_template/infrastructure/prd/prd_counter_repository.dart';
import 'package:flutter_template/infrastructure/sqflite_instance/instance.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class PrdProviderOverrides {
  //sqfliteのインスタンスを作成しrepositoryにDIする
  Future<Database> _sqliteDatabase() async {
    final sqliteDb = SqliteDatabase(
      version: 1,
      sqliteEnvType: SqliteEnvType.prd,
    );
    final db = await sqliteDb.db;
    return db;
  }

  Future<List<Override>> getPrdOverrides() async {
    final db = await _sqliteDatabase();
    return [
      counterRepositoryProvider.overrideWithValue(PrdCounterRepository()),
      countLogRepositoryProvider.overrideWithValue(PrdCounterLogRepository(db))
    ];
  }

  Future<List<Override>> getMockOverrides() async {
    return [counterRepositoryProvider.overrideWithValue(MockCountRepository())];
  }
}
