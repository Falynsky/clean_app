import 'package:flutter/material.dart';

class ScreenButtonList extends StatefulWidget {

  final List<Widget> buttons;

  const ScreenButtonList({required this.buttons, super.key});
  
  @override
  State<ScreenButtonList> createState() => _ScreenButtonListState();
}

class _ScreenButtonListState extends State<ScreenButtonList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.buttons,
    );
  }
}