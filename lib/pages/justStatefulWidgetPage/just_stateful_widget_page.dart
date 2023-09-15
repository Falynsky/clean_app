import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class JustStatefulWidgetPage extends StatefulWidget {
  const JustStatefulWidgetPage({Key? key}) : super(key: key);

  @override
  State<JustStatefulWidgetPage> createState() => _JustStatefulWidgetPageState();
}

class _JustStatefulWidgetPageState extends State<JustStatefulWidgetPage> {
  late String currentTime;
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    currentTime = DateTime.now().toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'just_stateful_widget_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'just_stateful_widget_page');
    return Scaffold(
      appBar: AppBar(
        title: const Text('just_stateful_widget_page'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text('Naciśnij przycisk aby wyświetlić obecną godzinę'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        StopwatchUtils().stop(key: 'just_stateful_widget_page');
                      });
                      currentTime = DateTime.now().toString();
                    });
                  },
                  child: Text('Pokaż godzinę'),
                ),
                Text(currentTime),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
