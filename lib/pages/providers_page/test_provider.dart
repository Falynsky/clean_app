import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier {
  String _dateTime = '';

  String get dateTime => _dateTime;

  void getCurrentDate() {
    _dateTime = DateTime.now().toString();
    notifyListeners();
  }
}
