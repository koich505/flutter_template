import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/enum/brand_color_type.dart';

//
final brandColorRepositoryProvider = Provider<BrandColorRepository>(
  (_) => throw UnimplementedError(),
);

abstract interface class BrandColorRepository {
  //保存したcountLogをリストで取得
  Future<BrandColorType> fetch();

  //countLogを保存
  Future<void> upsert(BrandColorType brandColorType);
}
