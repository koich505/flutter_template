import 'package:flutter_template/domain/repository/count/counter_repository_provider.dart';
import 'package:flutter_template/domain/entity/count/count.dart';
import 'package:flutter_template/domain/features/creator/count_creator.dart';

//開発時に利用するモックのrepository
class MockCountRepository implements CounterRepository {
  @override
  Future<Count?> fetch() async {
    return CountCreator.create();
  }

  @override
  Future<void> saveCount(Count count) async {}
}
