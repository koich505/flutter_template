import 'package:flutter_template/domain/repository/ad/interstitial_ad_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_ad_count_provider.g.dart';

@riverpod
Future<int> showAdCount(ShowAdCountRef ref) async {
  //repositoryからcountを取得する
  final int? showAdCount =
      await ref.read(interStitialAdRepositoryProvider).fetchShowAdCount();

  //countが取得できない場合は初期値を生成する
  return showAdCount ?? 0;
}
