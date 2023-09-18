import 'package:flutter/material.dart';

class ScreenButtonList extends StatelessWidget {
  final List<Widget> buttons;

  const ScreenButtonList({required this.buttons, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buttons,
    );
  }
}
