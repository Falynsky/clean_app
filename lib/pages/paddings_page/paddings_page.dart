import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaddingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationCubit navigationCubit = context.read<NavigationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'container_page_draw');
    });
    StopwatchUtils().start(key: 'container_page_constructor');
    StopwatchUtils().start(key: 'container_page_draw');
    final Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox'),
      ),
      body: WillPopScope(
        onWillPop: () => onWillPop(navigationCubit),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < 10000; i++)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('test'),
                ),
            ],
          ),
        ),
      ),
    );
    StopwatchUtils().stop(key: 'container_page_constructor');
    return scaffold;
  }

  Future<bool> onWillPop(NavigationCubit navigationCubit) async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
