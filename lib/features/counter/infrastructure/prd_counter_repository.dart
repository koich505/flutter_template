import 'package:flutter_template/features/common_utils/app_exception.dart';
import 'package:flutter_template/features/counter/domain/repository/count_repository_provider.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';
import 'package:flutter_template/features/counter/domain/features/count_converter.dart';
import 'package:flutter_template/features/counter/infrastructure/counter_repository_constants.dart';
import 'package:flutter_template/presentation/page/counter/text/page_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

//実行環境のrepository
class PrdCounterRepository implements CounterRepository {
  //sharedPreferencesのインスタンスを取得する
  Future<SharedPreferences> get pref async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }

  //sharedPreferencesに保存する際のkey
  String get key => CounterConstants().countKey;

  @override
  Future<Count?> fetch() async {
    final pref = await this.pref;
    try {
      final countString = pref.getString(key);

      //sharedPreferencesに値が保存されてい無い場合nullを返し処理を終了
      if (countString == null) return null;

      //string型で保存したcountをCount型に変換する
      final count = const CountConverter()
          .fromSharedPreferencesString(countString: countString);
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
      final countString =
          CountConverter.toSharedPreferencesString(count: count);

      //保存
      await pref.setString(key, countString);
    } catch (e) {
      //setIntが失敗した場合は、AppExceptionをthrowする
      throw const AppException(countSaveFailed);
    }
  }
}
