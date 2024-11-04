import 'package:flutter_template/infrastructure/constants/count_log_repository_constants.dart';
import 'package:flutter_template/infrastructure/constants/counter_repository_constants.dart';

mixin class RepositoryConstants {
  CounterConstants get counterConstants => CounterConstants();
  CountLogConstants get countLogConstants => CountLogConstants();
}
