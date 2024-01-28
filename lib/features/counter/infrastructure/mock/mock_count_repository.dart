import 'package:flutter_template/features/counter/domain/repository/count_repository_provider.dart';
import 'package:flutter_template/features/counter/domain/entity/count.dart';
import 'package:flutter_template/features/counter/domain/features/count_creator.dart';

//開発時に利用するモックのrepository
class MockCountRepository implements CounterRepository {
  @override
  Future<Count?> fetch() async {
    return CountCreator.create();
  }

  @override
  Future<void> saveCount(Count count) async {}
}
