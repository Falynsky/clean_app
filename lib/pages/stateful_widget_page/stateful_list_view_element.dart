import 'package:flutter/material.dart';

class StatefulListViewElement extends StatefulWidget {
  final int index;

  const StatefulListViewElement({required this.index});
  @override
  _StatefulListViewElementState createState() => _StatefulListViewElementState();
}

class _StatefulListViewElementState extends State<StatefulListViewElement> {
  late int index;
  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  void didUpdateWidget(covariant StatefulListViewElement oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != oldWidget.index) {
      setState(() {
        index = widget.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('index: $index'),
      ),
    );
  }
}
