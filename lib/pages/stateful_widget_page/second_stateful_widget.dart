import 'package:flutter/material.dart';
import 'package:unclean_app/pages/stateful_widget_page/third_stateful_widget.dart';

class SecondStatefulWidget extends StatefulWidget {
  final int number;

  const SecondStatefulWidget({required this.number});

  @override
  _SecondStatefulWidgetState createState() => _SecondStatefulWidgetState();
}

class _SecondStatefulWidgetState extends State<SecondStatefulWidget> {
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.number;
  }

  @override
  void didUpdateWidget(covariant SecondStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.number != oldWidget.number) {
      setState(() {
        number = widget.number;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color(0xFFAA1177),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 80, child: Center(child: Text('To jest drugi zagnieżdżony StatefulWidget'))),
            ThirdStatefulWidget(number: number),
          ],
        ),
      ),
    );
  }
}
