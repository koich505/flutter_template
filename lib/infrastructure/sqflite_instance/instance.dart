import 'package:flutter_template/domain/enum/environment_enum.dart';
import 'package:flutter_template/infrastructure/sqflite_instance/migration.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqliteDatabase {
  final int version;
  final SqliteEnvType sqliteEnvType;

  static SqliteDatabase? _instance;

  SqliteDatabase._internal({
    required this.version,
    required this.sqliteEnvType,
  });

  factory SqliteDatabase({
    required int version,
    required SqliteEnvType sqliteEnvType,
  }) {
    // すでにインスタンスが作成されている場合はそれを返す
    _instance ??= SqliteDatabase._internal(
      version: version,
      sqliteEnvType: sqliteEnvType,
    );
    return _instance!;
  }

  String get _dbName => sqliteEnvType.dbName;

  Future<Database> get db async {
    final database = await openDatabase(
      p.join(await getDatabasesPath(), _dbName),
      version: version,
      //初回起動時にDBが作成された時に実行される関数
      //tableを作成する
      //SqliteMigrations.onCreateQueryにクエリを記述する
      onCreate: (db, version) async {
        final sqlMigrations = SqliteMigrations();
        final initialSqlList = sqlMigrations.onCreateQuery;

        for (String initialSql in initialSqlList) {
          await db.execute(initialSql);
        }

        return;
      },
      //バージョンを変更した時に実行される関数
      //tableの構造などを修正できる
      //SqliteMigrations.onUpgrageQueryにクエリを記述する
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        final sqlMigrations = SqliteMigrations();
        final upGradeScripts = sqlMigrations.onUpgrageQuery;
        for (var i = oldVersion + 1; i <= newVersion; i++) {
          var query = upGradeScripts[i];
          if (query == null) continue;

          for (String query in query) {
            await db.execute(query);
          }
        }
      },
    );
    return database;
  }
}
