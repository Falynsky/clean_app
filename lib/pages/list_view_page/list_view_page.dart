import 'package:clean_app/bloc/list_view_bloc/list_view_bloc.dart';
import 'package:clean_app/bloc/list_view_bloc/list_view_event.dart';
import 'package:clean_app/bloc/list_view_bloc/list_view_state.dart';
import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/pages/list_view_page/list_view_card_list.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewBuilderPage extends StatefulWidget {
  const ListViewBuilderPage({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderPage> createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  late NavigationCubit navigationCubit;
  late final TransactionsBloc transactionsBloc;
  late final StopwatchUtils scrollToBottomStopwatchUtils;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    transactionsBloc = TransactionsBloc();
    scrollToBottomStopwatchUtils = StopwatchUtils();
    scrollController.addListener(() {
      final ScrollPosition position = scrollController.position;
      if (position.atEdge && position.pixels == position.maxScrollExtent && !position.outOfRange) {
        scrollToBottomStopwatchUtils.stop(key: 'scroll_timer_down');
      } else if (position.atEdge && position.pixels == position.minScrollExtent && !position.outOfRange) {
        scrollToBottomStopwatchUtils.stop(key: 'scroll_timer_up');
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'list_view_page_draw');
    });
  }

  void _onPressed() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      scrollToBottomStopwatchUtils.start(key: 'scroll_timer_up', description: 'Time to scroll up:');
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    } else {
      scrollToBottomStopwatchUtils.start(key: 'scroll_timer_down', description: 'Time to scroll down:');
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'list_view_page_draw');
    stopwatchUtils..start(key: 'list_view_page_constructor');
    final Widget widget = Scaffold(
      appBar: AppBar(
        title: const Text('ListView Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        splashColor: Colors.red,
        child: const Icon(Icons.slow_motion_video),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocProvider<TransactionsBloc>(
          create: (BuildContext context) => transactionsBloc,
          child: BlocBuilder<TransactionsBloc, TransactionsState>(
            bloc: transactionsBloc,
            builder: (BuildContext context, TransactionsState state) {
              if (state is TransactionsInitial) {
                transactionsBloc.add(LoadTransactionsEvent());
              } else if (state is TransactionsLoadedState) {
                return ListViewBuilderCardList(scrollController: scrollController);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
    stopwatchUtils..stop(key: 'list_view_page_constructor');
    return widget;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
