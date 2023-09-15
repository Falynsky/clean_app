import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class TestListConfig extends Equatable {
  final String name;
  final int amount;
  final bool isDone;

  const TestListConfig({
    required this.name,
    required this.amount,
    required this.isDone,
  });

  @override
  List<Object> get props => <Object>[name, amount, isDone];
}

void main() {
  const int sizeOfFirstList = 10000;
  const int sizeOfSecondList = 15000;
  late List<TestListConfig> firstList;
  late List<TestListConfig> secondList;
  setUp(() {
    firstList = <TestListConfig>[
      for (int i = 0; i < sizeOfFirstList; i++)
        TestListConfig(
          name: i.toString(),
          amount: i,
          isDone: i.isEven,
        ),
    ];

    secondList = <TestListConfig>[
      for (int i = sizeOfSecondList - sizeOfFirstList; i < sizeOfSecondList; i++)
        TestListConfig(
          name: i.toString(),
          amount: i,
          isDone: i.isEven,
        ),
    ];
  });
  test('list of TestListConfig', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils.start(key: 'toSet().toList()');
    List<TestListConfig> mergedList = <TestListConfig>[];
    mergedList.addAll(<TestListConfig>[...firstList, ...secondList]);
    mergedList = mergedList.toSet().toList();
    print(mergedList.length);
    stopwatchUtils.stop(key: 'toSet().toList()');
  });

  test('list of TestListConfig', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils.start(key: 'mergeManuallyLists');

    final List<TestListConfig> mergedList = <TestListConfig>[];
    mergedList.addAll(firstList);
    for (final TestListConfig element in secondList) {
      if (!mergedList.contains(element)) {
        mergedList.add(element);
      }
    }
    print(mergedList.length);
    stopwatchUtils.stop(key: 'mergeManuallyLists');
  });

  test('adding to set', () {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils.start(key: 'mergeManuallyLists');

    final Set<TestListConfig> seen = <TestListConfig>{};
    final List<TestListConfig> mergedUnUnique = <TestListConfig>[...firstList, ...secondList];
    final List<TestListConfig> uniquelist = mergedUnUnique.where(seen.add).toList();
    print(uniquelist.length);
    stopwatchUtils.stop(key: 'mergeManuallyLists');
  });
}
