import 'package:flutter_template/domain/entity/app_exception.dart';
import 'package:flutter_template/domain/features/converter/shared_preferences_converter.dart';
import 'package:flutter_template/domain/repository/count/counter_repository_provider.dart';
import 'package:flutter_template/domain/entity/count/count.dart';
import 'package:flutter_template/infrastructure/constants/repository_constants.dart';
import 'package:flutter_template/presentation/page/counter/text/page_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

//実行環境のrepository
class PrdCounterRepository
    with RepositoryConstants
    implements CounterRepository {
  //sharedPreferencesのインスタンスを取得する
  Future<SharedPreferences> get pref async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }

  //sharedPreferencesに保存する際のkey
  String get key => counterConstants.countKey;

  @override
  Future<Count?> fetch() async {
    final pref = await this.pref;
    try {
      final countString = pref.getString(key);

      //sharedPreferencesに値が保存されてい無い場合nullを返し処理を終了
      if (countString == null) return null;

      //string型で保存したcountをCount型に変換する
      final countMap =
          const SharedPreferencesStringConverter().toJson(countString);
      final count = Count.fromJson(countMap);

      return count;
    } catch (e) {
      //setIntが失敗した場合は、AppExceptionをthrowする
      throw const AppException(countSaveFailed);
    }
  }

  @override
  Future<void> saveCount(Count count) async {
    final pref = await this.pref;
    try {
      //countをsharedPreferencesに保存する
      //stringに変換してから保存する
      final countMap = count.toJson();
      final countString =
          const SharedPreferencesStringConverter().fromJson(countMap);

      //保存
      await pref.setString(key, countString);
    } catch (e) {
      //setIntが失敗した場合は、AppExceptionをthrowする
      throw const AppException(countSaveFailed);
    }
  }
}
