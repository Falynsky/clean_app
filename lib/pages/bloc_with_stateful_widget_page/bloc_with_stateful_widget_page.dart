import 'package:clean_app/bloc/bloc_with_stateful_widget_bloc/bloc_with_stateful_widget_bloc.dart';
import 'package:clean_app/bloc/bloc_with_stateful_widget_bloc/bloc_with_stateful_widget_event.dart';
import 'package:clean_app/bloc/bloc_with_stateful_widget_bloc/bloc_with_stateful_widget_state.dart';
import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWithStatefulWidgetPage extends StatefulWidget {
  const BlocWithStatefulWidgetPage({Key? key}) : super(key: key);

  @override
  State<BlocWithStatefulWidgetPage> createState() => _BlocWithStatefulWidgetPageState();
}

class _BlocWithStatefulWidgetPageState extends State<BlocWithStatefulWidgetPage> {
  late String currentTime;
  late NavigationCubit navigationCubit;
  late BlocWithStatefulWidgetBloc blocWithStatefulWidgetBloc;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    blocWithStatefulWidgetBloc = BlocWithStatefulWidgetBloc(const BlocWithStatefulWidgetState(''));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'bloc_with_stateful_widget_page_draw');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'bloc_with_stateful_widget_page_draw');
    return Scaffold(
      appBar: AppBar(
        title: const Text('just_stateful_widget_page'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocBuilder<BlocWithStatefulWidgetBloc, BlocWithStatefulWidgetState>(
          bloc: blocWithStatefulWidgetBloc,
          builder: (BuildContext context, BlocWithStatefulWidgetState state) {
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    const Text('Naciśnij przycisk aby wyświetlić obecną godzinę'),
                    ElevatedButton(
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          StopwatchUtils().stop(key: 'bloc_with_stateful_widget_page_draw');
                        });
                        StopwatchUtils().start(key: 'bloc_with_stateful_widget_page_draw');
                        blocWithStatefulWidgetBloc.add(GetCurrentDate());
                      },
                      child: const Text('Pokaż godzinę'),
                    ),
                    Text(state.dateTime),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
