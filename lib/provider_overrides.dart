import 'package:flutter_template/domain/repository/count/count_repository_provider.dart';
import 'package:flutter_template/infrastructure/mock/mock_count_repository.dart';
import 'package:flutter_template/infrastructure/prd/prd_counter_repository.dart';

//本番時に利用するrepository
final prdProviderOverrides = [
  counterRepositoryProvider.overrideWithValue(PrdCounterRepository())
];

//開発時に利用するモックのrepository
final mockProviderOverrides = [
  counterRepositoryProvider.overrideWithValue(MockCountRepository())
];
