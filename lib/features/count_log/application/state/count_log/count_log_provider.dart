import 'package:flutter_template/features/count_log/domain/entity/count_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_log_provider.g.dart';

@riverpod
class CountLogList extends _$CountLogList {
  @override
  Future<List<CountLog>> build() async => [];

  Future<void> addCountLog({required CountLog countLog}) async {
    final previousList = await future;
    state = AsyncData([...previousList, countLog]);
  }
}
