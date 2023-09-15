import 'package:flutter_test/flutter_test.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';

// ignore_for_file: unused_local_variable
void main() {
  test('dynamic as list of maps', () {
    final dynamic list = <dynamic>[
      <String, dynamic>{
        'key_1': '123',
        'key_2': '123',
        'key_3': '123',
        'key_4': '123',
      },
      <String, dynamic>{
        'key_1': '123',
        'key_2': '123',
        'key_3': '123',
        'key_4': '123',
      }
    ];

    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils.start(key: 'dynamic as list of maps');
    final dynamic length = list.length;
    stopwatchUtils.stop(key: 'dynamic as list of maps');
  });

  test('list of maps', () {
    final List<Map<String, String>> list = <Map<String, String>>[
      <String, String>{
        'key_1': '123',
        'key_2': '123',
        'key_3': '123',
        'key_4': '123',
      },
      <String, String>{
        'key_1': '123',
        'key_2': '123',
        'key_3': '123',
        'key_4': '123',
      }
    ];

    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils.start(key: 'list of maps');
    final dynamic length = list.length;
    stopwatchUtils.stop(key: 'list of maps');
  });
}
