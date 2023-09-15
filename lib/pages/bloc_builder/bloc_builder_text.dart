import 'package:clean_app/bloc/bloc_builder_bloc/bloc_builder_bloc.dart';
import 'package:clean_app/utils/widget_build_counter_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlocBuilderTextState();
}

class _BlocBuilderTextState extends State<BlocBuilderText> {
  @override
  void initState() {
    WidgetBuildCounterUtils().start(key: 'bloc_builder_text');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BlocListenerBloc blocBuilderBloc = context.read<BlocListenerBloc>();
    WidgetBuildCounterUtils().add(key: 'bloc_builder_text');
    WidgetBuildCounterUtils().get(key: 'bloc_builder_text');
    return Column(
      children: <Widget>[
        Text(
          DateTime.now().toString(),
        ), //ten widget powinien sie odsiwezyc tylko jak bedzie zatrzymany stiper lub zerowany
        Text(blocBuilderBloc.state.counter.toString()),
      ],
    );
  }
}
