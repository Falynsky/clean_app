import 'package:clean_app/pages/stateful_widget_page/third_stateful_widget.dart';
import 'package:flutter/material.dart';

class SecondStatelessWidget extends StatelessWidget {
  final int number;

  const SecondStatelessWidget({required this.number});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color(0xFFAA1177),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 80, child: Center(child: Text('To jest drugi zagnieżdżony StatelessWidget'))),
            ThirdStatelessWidget(number: number),
          ],
        ),
      ),
    );
  }
}
