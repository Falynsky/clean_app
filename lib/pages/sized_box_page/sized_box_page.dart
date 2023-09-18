import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'container_page_draw');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'container_page_draw');
    StopwatchUtils().start(key: 'container_page');
    final Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < 10000; i++) i.isEven ? Container(height: 10) : const Text('test'),
            ],
          ),
        ),
      ),
    );
    StopwatchUtils().stop(key: 'container_page');
    return scaffold;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
