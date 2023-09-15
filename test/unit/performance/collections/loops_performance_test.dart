import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

// ignore_for_file: unused_local_variable
void main() {
  final List<int> list = <int>[];

  setUp(() {
    list.addAll(List<int>.generate(3000000, (int index) => index));
  });

  test('while loop', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'while loop');
    int count = 0;
    num eachElement = 0;
    while (count < list.length) {
      eachElement = pow(list[count], 3);
      count++;
    }

    stopwatchUtils..stop(key: 'test');
  });

  test('while loop cashed length', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'while loop cashed length');
    int count = 0;
    num eachElement = 0;
    final int length = list.length;
    while (count < length) {
      eachElement = pow(list[count], 3);
      count++;
    }

    stopwatchUtils..stop(key: 'test');
  });

  test('for loop cached length', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'for loop cached length');

    num eachElement = 0;
    final int length = list.length;
    for (int i = 0; i < length; i++) {
      eachElement = pow(list[i], 3);
    }
    stopwatchUtils..stop(key: 'test');
  });

  test('for loop', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'for loop');

    num eachElement = 0;
    for (int i = 0; i < list.length; i++) {
      eachElement = pow(list[i], 3);
    }
    stopwatchUtils..stop(key: 'test');
  });

  test('while loop cashed length reversed order', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'while loop cashed length reversed order');
    int count = list.length - 1;
    num eachElement = 0;
    while (count >= 0) {
      eachElement = pow(list[count], 3);
      count--;
    }

    stopwatchUtils..stop(key: 'test');
  });

  test('forEach loop', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'forEach loop');

    num eachElement = 0;
    for (final int element in list) {
      eachElement = pow(element, 3);
    }
    stopwatchUtils..stop(key: 'test');
  });

  test('fo..in loop', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'fo..in loop');

    num eachElement = 0;
    for (final int element in list) {
      eachElement = pow(element, 3);
    }
    stopwatchUtils..stop(key: 'test');
  });

  test('map loop', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'map loop');
    num eachElement = 0;
    list.map((int e) {
      eachElement = pow(e, 3);
    }).toList();

    stopwatchUtils..stop(key: 'test');
  });
}
