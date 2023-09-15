import 'package:clean_app/configs/transaction.dart';
import 'package:clean_app/dialogs/transaction_preview.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';

class ListViewCard extends StatefulWidget {
  final Transaction transaction;

  const ListViewCard({required this.transaction, Key? key}) : super(key: key);

  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  late final Transaction transaction;
  @override
  void initState() {
    super.initState();
    transaction = widget.transaction;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final StopwatchUtils stopwatchUtils = StopwatchUtils();
        stopwatchUtils.start(key: 'transaction_card');
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              final TransactionPreview transactionPreview = TransactionPreview(transaction: transaction);
              stopwatchUtils.stop(key: 'transaction_card');
              return transactionPreview;
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const SizedBox(
                    width: 38,
                    height: 38,
                  ),
                ),
                const SizedBox(width: 10), // 16 is the default padding for ListTile
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${widget.transaction.name}'),
                    const SizedBox(height: 5),
                    Text(
                      '${widget.transaction.dateTime}',
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${widget.transaction.amount} pln',
              style: TextStyle(
                color: widget.transaction.amount > 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
