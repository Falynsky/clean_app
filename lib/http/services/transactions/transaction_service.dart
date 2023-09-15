import 'dart:math';

import 'package:unclean_app/configs/transaction.dart';
import 'package:unclean_app/enums/transaction_name_enum_extension.dart';

class TransactionService {
  List<Transaction> fetchTransactions(int transactionSize) {
    return <Transaction>[
      for (int i = 1; i < transactionSize + 1; i++)
        Transaction(
          id: i,
          name: 'transaction nr.: $i',
          amount: Random().nextInt(1500) - 500,
          dateTime: getRandomDateTimeFromYear2023(),
          transactionInfo: TransactionNameExtension.getRandomTransactionName(),
          userId: Random().nextInt(3),
        ),
    ];
  }

  String getRandomDateTimeFromYear2023() {
    const int year = 2023;
    final int month = Random().nextInt(12) + 1;
    final int day = Random().nextInt(28) + 1;
    final int hour = Random().nextInt(24);
    final int minute = Random().nextInt(60);
    final int second = Random().nextInt(60);
    return '$year-$month-$day $hour:$minute:$second';
  }
}
