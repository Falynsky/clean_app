import 'dart:math';

import 'package:unclean_app/enums/transaction_name_enum.dart';

extension TransactionNameExtension on TransactionName {
  static String getRandomTransactionName() {
    const List<TransactionName> values = TransactionName.values;
    final int randomIndex = Random().nextInt(values.length);
    return values[randomIndex].toString();
  }
}
