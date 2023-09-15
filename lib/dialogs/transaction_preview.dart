import 'package:clean_app/configs/transaction.dart';
import 'package:flutter/material.dart';

class TransactionPreview extends StatefulWidget {
  final Transaction transaction;

  const TransactionPreview({required this.transaction});

  @override
  _TransactionPreviewState createState() => _TransactionPreviewState();
}

class _TransactionPreviewState extends State<TransactionPreview> {
  late final Transaction transaction;

  @override
  void initState() {
    super.initState();
    transaction = widget.transaction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Text(transaction.name),
    );
  }
}
