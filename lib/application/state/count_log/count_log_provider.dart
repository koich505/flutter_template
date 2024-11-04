import 'package:flutter_template/domain/entity/count_log/count_log.dart';
import 'package:flutter_template/domain/repository/count/count_log_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_log_provider.g.dart';

@riverpod
class CountLogList extends _$CountLogList {
  @override
  Future<List<CountLog>> build() async {
    final List<CountLog> countLogList =
        await ref.read(countLogRepositoryProvider).fetch();
    return countLogList;
  }

  Future<void> addCountLog({required CountLog countLog}) async {
    final previousList = await future;
    state = AsyncData([...previousList, countLog]);
  }
}
