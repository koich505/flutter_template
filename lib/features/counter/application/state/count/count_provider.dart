import 'package:flutter_template/features/counter/domain/repository/count_repository_provider.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';
import 'package:flutter_template/features/counter/domain/features/count_creator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_provider.g.dart';

@riverpod
Future<Count> count(CountRef ref) async {
  //repositoryからcountを取得する
  final Count? count = await ref.read(counterRepositoryProvider).fetch();

  //countが取得できない場合は初期値を生成する
  return count ?? CountCreator.create();
}
