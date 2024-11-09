import 'package:flutter_template/infrastructure/constants/count_log_repository_constants.dart';
import 'package:flutter_template/infrastructure/constants/shared_preferences_key.dart';

mixin class RepositoryConstants {
  RepositoryConstants._();
  CountLogConstants get countLogConstants => CountLogConstants();
  SharedPreferencesKeys get sharedPreferencesKeys => SharedPreferencesKeys();
}
