import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unclean_app/pages/stateful_widget_page/stateful_list_view_element.dart';

class AnotherSecondStatefulWidget extends StatefulWidget {
  const AnotherSecondStatefulWidget();

  @override
  State<AnotherSecondStatefulWidget> createState() => _AnotherSecondStatefulWidgetState();
}

class _AnotherSecondStatefulWidgetState extends State<AnotherSecondStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final String time = DateTime.now().toIso8601String().substring(0, 23);
    return Expanded(
      child: ColoredBox(
        color: const Color.fromARGB(255, 54, 167, 88),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 80, child: Center(child: Text('To jest inny drugi zagnieżdżony StatefulWidget'))),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 200,
                itemBuilder: (_, int index) {
                  return StatefulListViewElement(index: Random().nextInt(11) * index);
                },
              ),
            ),
            Container(
              height: 40,
              color: Colors.lightGreen,
              child: Center(child: Text('$time')),
            ),
          ],
        ),
      ),
    );
  }
}
