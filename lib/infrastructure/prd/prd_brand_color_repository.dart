import 'package:flutter_template/domain/entity/error/error_code/sharepreferences_error_code.dart';
import 'package:flutter_template/domain/entity/error/exception/sharedpreferences_exception.dart';
import 'package:flutter_template/domain/enum/brand_color_type.dart';
import 'package:flutter_template/domain/repository/brand_color_repository.dart';
import 'package:flutter_template/infrastructure/constants/repository_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//実行環境のrepository
class PrdBrandColorRepository
    with RepositoryConstants
    implements BrandColorRepository {
  //sharedPreferencesのインスタンスを取得する
  Future<SharedPreferences> get pref async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }

  //sharedPreferencesに保存する際のkey
  String get key => sharedPreferencesKeys.brandColorKey;

  BrandColorType get defaultBrandColor => BrandColorType.blue;

  @override
  Future<BrandColorType> fetch() async {
    final pref = await this.pref;
    final brandColorName = pref.getString(key);

    //sharedPreferencesにブランドカラーが保存されていない場合
    if (brandColorName == null) {
      //defaultColorを保存する
      await upsert(defaultBrandColor);
      return defaultBrandColor;
    }
    final brandColorType = BrandColorType.values.byName(brandColorName);

    return brandColorType;
  }

  @override
  Future<void> upsert(BrandColorType brandColorType) async {
    try {
      final pref = await this.pref;
      //保存
      await pref.setString(key, brandColorType.name);
    } catch (e) {
      //saveCountが失敗した場合は、Exceptionをthrowする
      throw const SharedpreferencesException(
          SharedPreferencesErrorCode.dataSaveError);
    }
  }
}
