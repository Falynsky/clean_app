import 'dart:math';

import 'package:clean_app/pages/stateful_widget_page/stateful_list_view_element.dart';
import 'package:flutter/material.dart';

class AnotherSecondStatefulWidget extends StatelessWidget {
  const AnotherSecondStatefulWidget();

  @override
  Widget build(BuildContext context) {
    final String time = DateTime.now().toIso8601String().substring(0, 23);
    return Expanded(
      child: ColoredBox(
        color: const Color.fromARGB(255, 54, 167, 88),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 80, child: Center(child: Text('To jest inny drugi zagnieżdżony StatelessWidget'))),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 200,
                itemBuilder: (_, int index) {
                  return StatelessListViewElement(index: Random().nextInt(11) * index);
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
