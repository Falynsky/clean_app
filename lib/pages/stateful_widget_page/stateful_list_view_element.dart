import 'package:flutter/material.dart';

class StatelessListViewElement extends StatelessWidget {
  final int index;

  const StatelessListViewElement({required this.index});
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
