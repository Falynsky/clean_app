import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_state.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/bloc_builder/bloc_builder_counter_content.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class BlocBuilderPage extends StatefulWidget {
  const BlocBuilderPage();

  @override
  State<BlocBuilderPage> createState() => _BlocBuilderPageState();
}

class _BlocBuilderPageState extends State<BlocBuilderPage> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'bloc_builder');
    });
  }

  @override
  Widget build(BuildContext context) {
    final BlocBuilderBloc blocBuilderBloc = BlocBuilderBloc(const BlocBuilderState(0, false));
    StopwatchUtils().start(key: 'bloc_builder', description: 'bloc_builder');
    final Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder Page'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocProvider<BlocBuilderBloc>(
          create: (_) => blocBuilderBloc,
          child: BlocBuilder<BlocBuilderBloc, BlocBuilderState>(
            bloc: blocBuilderBloc,
            builder: (BuildContext context, BlocBuilderState state) {
              return BlocBuilderCounterContent();
            },
          ),
        ),
      ),
    );
    return scaffold;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
