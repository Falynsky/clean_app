import 'package:clean_app/bloc/bloc_builder_bloc/bloc_builder_bloc.dart';
import 'package:clean_app/bloc/bloc_builder_bloc/bloc_builder_state.dart';
import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/pages/bloc_builder/bloc_builder_counter_content.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerPage extends StatefulWidget {
  const BlocListenerPage();

  @override
  State<BlocListenerPage> createState() => _BlocListenerPageState();
}

class _BlocListenerPageState extends State<BlocListenerPage> {
  late NavigationCubit navigationCubit;
  late BlocListenerBloc blocListenerBloc;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    blocListenerBloc = BlocListenerBloc(const BlocListenerState(0, false));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'bloc_listener_draw');
    });
    StopwatchUtils().start(key: 'bloc_listener_draw');
    StopwatchUtils().start(key: 'bloc_listener');
    final Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Listener Page'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocProvider<BlocListenerBloc>(
          create: (_) => blocListenerBloc,
          child: BlocListener<BlocListenerBloc, BlocListenerState>(
            bloc: blocListenerBloc,
            listener: (BuildContext context, BlocListenerState state) {
              if (!state.isTimerActive) {
                setState(() {});
              }
            },
            child: BlocListenerCounterContent(),
          ),
        ),
      ),
    );
    StopwatchUtils().stop(key: 'bloc_listener');
    return scaffold;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
