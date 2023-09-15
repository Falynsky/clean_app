import 'package:clean_app/bloc/bloc_builder_bloc/bloc_builder_bloc.dart';
import 'package:clean_app/bloc/bloc_builder_bloc/bloc_builder_event.dart';
import 'package:clean_app/pages/bloc_builder/bloc_builder_text.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:clean_app/utils/widget_build_counter_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerCounterContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlocListenerCounterContentState();
}

class _BlocListenerCounterContentState extends State<BlocListenerCounterContent> {
  late final BlocListenerBloc blocBuilderBloc;
  @override
  void initState() {
    super.initState();
    blocBuilderBloc = context.read<BlocListenerBloc>();
    StopwatchUtils().start(key: 'bloc_listener_counter_content');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'bloc_listener_counter_content');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  StopwatchUtils().start(key: 'bloc_listener_counter_content');
                  blocBuilderBloc.add(StartTimer());
                },
                child: const Text('Włącz stoper'),
              ),
              ElevatedButton(
                onPressed: () {
                  blocBuilderBloc.add(StopTimer());
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    StopwatchUtils().stop(key: 'bloc_listener_counter_content');
                  });
                },
                child: const Text('Wyłącz stoper i wyswietl'),
              ),
              ElevatedButton(
                onPressed: () {
                  blocBuilderBloc.add(ResetTimer());
                  WidgetBuildCounterUtils().stop(key: 'bloc_listener_text');
                },
                child: const Text('Reset'),
              ),
            ],
          ),
          BlocBuilderText(),
        ],
      ),
    );
  }
}
