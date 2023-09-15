import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/pages/stateful_widget_page/first_stateful_widget.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    final NavigationCubit navigationCubit = context.read<NavigationCubit>();
    stopwatchUtils..start(key: 'sateful_widget_page');
    final Widget widget = Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Page'),
      ),
      body: WillPopScope(
        onWillPop: () => onWillPop(navigationCubit),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ColoredBox(
                color: Colors.amberAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                      child: Center(
                        child: Text(
                          'To jest główny StatefulWidget',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: const Text(
                              'static progess : ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Container(
                                child: const LinearProgressIndicator(
                                  value: 0.25,
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    OnlyStatefulWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    stopwatchUtils..stop(key: 'sateful_widget_page');
    return widget;
  }

  Future<bool> onWillPop(NavigationCubit navigationCubit) async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
