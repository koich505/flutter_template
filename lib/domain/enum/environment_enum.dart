enum SqliteEnvType {
  prd,
  dev,
  test,
}

extension SqliteEnvTypeExtDbName on SqliteEnvType {
  String get dbName {
    const String dbName = "shopping_memo.db";
    return "${name}_$dbName";
  }
}
