import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unclean_app/pages/stateful_widget_page/another_second_stateful_widget.dart';
import 'package:unclean_app/pages/stateful_widget_page/second_stateful_widget.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class FirstStatefulWidget extends StatefulWidget {
  @override
  _FirstStatefulWidgetState createState() => _FirstStatefulWidgetState();
}

class _FirstStatefulWidgetState extends State<FirstStatefulWidget> {
  late int number;
  @override
  void initState() {
    super.initState();
    number = Random().nextInt(100);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'first_stateful_widget_draw');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'first_stateful_widget_draw');
    StopwatchUtils().start(key: 'first_stateful_widget');
    final Expanded widget = Expanded(
      child: ColoredBox(
        color: const Color(0xFF6711AA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 80,
              child: Center(
                child: Text('To jest pierwszy zagnieżdżony StatefulWidget'),
              ),
            ),
            Center(
              child: InkWell(
                onTap: _incrementCounter,
                child: Container(
                  width: 100,
                  color: Colors.amberAccent,
                  child: const Text(
                    'losój numer',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SecondStatefulWidget(number: number),
            const AnotherSecondStatefulWidget(),
          ],
        ),
      ),
    );
    StopwatchUtils().stop(key: 'first_stateful_widget');
    return widget;
  }

  void _incrementCounter() {
    number = Random().nextInt(100);
    StopwatchUtils().start(key: 'losoj_numer_rebuild');
        WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'first_stateful_widget_draw');
    });
    setState(() {});
  }
}
