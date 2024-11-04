import 'package:flutter_template/infrastructure/constants/repository_constants.dart';

class SqliteMigrations with RepositoryConstants {
  //データベースを作成した初回に実行されるsql
  List<String> get onCreateQuery => [
        """
      CREATE TABLE ${countLogConstants.localTableName}(
        ${countLogConstants.createdAtFieldName} TEXT,
        ${countLogConstants.previousValueFieldName} INTEGER,
        ${countLogConstants.newValueFieldName} INTEGER
      )
      """
      ];

  //バージョンを上げた時に実行されるSQL
  Map<int, List<String>> get onUpgrageQuery => {};
}
