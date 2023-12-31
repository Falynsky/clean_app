import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizedBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SizedBoxPageState();
}

class _SizedBoxPageState extends State<SizedBoxPage> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'sized_box_page_draw');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'sized_box_page_draw');
    StopwatchUtils().start(key: 'sized_box_page');
    final Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < 10000; i++) i.isEven ? const SizedBox(height: 10) : const Text('test'),
            ],
          ),
        ),
      ),
    );
    StopwatchUtils().stop(key: 'sized_box_page');
    return scaffold;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
