import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entity/count_log/count_log.dart';
import 'package:intl/intl.dart';

class CountLogTile extends ConsumerWidget {
  final CountLog countLog;
  const CountLogTile({
    required this.countLog,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countLogTile = Card(
        child: Column(
      children: [
        Text(DateFormat('yyyy-MM-dd').format(countLog.createdAt)),
        Text(
            "${countLog.previousValue.toString()} -> ${countLog.newValue.toString()}")
      ],
    ));

    return countLogTile;
  }
}
