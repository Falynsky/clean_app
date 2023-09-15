import 'package:flutter/material.dart';

class ThirdStatelessWidget extends StatelessWidget {
  final int number;

  const ThirdStatelessWidget({required this.number});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color(0xFFCA6117),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 80,
              child: Center(
                child: Text('To jest trzeci zagnieżdżony StatelessWidget'),
              ),
            ),
            Text('Number: $number'),
          ],
        ),
      ),
    );
  }
}
