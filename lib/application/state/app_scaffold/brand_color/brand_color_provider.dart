import 'package:flutter_template/domain/enum/brand_color_type.dart';
import 'package:flutter_template/domain/repository/brand_color_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brand_color_provider.g.dart';

@riverpod
Future<BrandColorType> brandColor(BrandColorRef ref) async {
  //repositoryからbrandColorを取得する
  final BrandColorType brandColorType =
      await ref.read(brandColorRepositoryProvider).fetch();

  //countが取得できない場合は初期値を生成する
  return brandColorType;
}
