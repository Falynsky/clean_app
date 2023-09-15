import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unclean_app/configs/transaction.dart';
import 'package:unclean_app/http/services/transactions/transaction_service.dart';
import 'package:unclean_app/pages/list_view_page/list_view_card.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

void main() {
  final List<String> bigItems = <String>[];
  final List<Transaction> bigItemsTransaction = <Transaction>[];

  setUpAll(() {
    bigItems.addAll(List<String>.generate(10, (int index) => 'Item $index'));
    bigItemsTransaction.addAll(TransactionService().fetchTransactions(10));
  });

  tearDownAll(() {
    bigItemsTransaction.clear();
    bigItems.clear();
  });

  testWidgets('ListView should display items', (WidgetTester tester) async {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'ListView should display items');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          children: bigItems.map((String i) => Container(child: Text(i))).toList(),
        ),
      ),
    ),);
    stopwatchUtils..stop(key: 'test');

    // Find the text widgets
    final Finder textFinders = find.byType(Text);
    print('found ${textFinders.evaluate().length} widgets');
  });

  testWidgets('ListView.builder should display items', (WidgetTester tester) async {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'ListView.builder should display items');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: bigItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(child: Text(bigItems[index]));
          },
        ),
      ),
    ),);
    stopwatchUtils..stop(key: 'test');

    // Find the text widgets
    final Finder textFinders = find.byType(Text);

    print('found ${textFinders.evaluate().length} widgets');
    // Verify that the text widgets are displayed
  });

  testWidgets('ListView should display items - transactions', (WidgetTester tester) async {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'ListView should display items');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          children: bigItemsTransaction.map((Transaction i) => ListViewCard(transaction: i)).toList(),
        ),
      ),
    ),);
    stopwatchUtils..stop(key: 'test');

    // Find the text widgets
    final Finder textFinders = find.byType(Text);
    print('found ${textFinders.evaluate().length} widgets');
  });

  testWidgets('ListView.builder should display items - transactions', (WidgetTester tester) async {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'ListView.builder should display items');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: bigItemsTransaction.length,
          itemBuilder: (BuildContext context, int index) {
            return ListViewCard(transaction: bigItemsTransaction[index]);
          },
        ),
      ),
    ),);
    stopwatchUtils..stop(key: 'test');

    // Find the text widgets
    final Finder textFinders = find.byType(Text);

    print('found ${textFinders.evaluate().length} widgets');
    // Verify that the text widgets are displayed
  });
}
