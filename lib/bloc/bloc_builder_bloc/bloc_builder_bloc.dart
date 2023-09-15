import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_event.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_state.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class BlocBuilderBloc extends Bloc<BlocBuilderEvent, BlocBuilderState> {
  BlocBuilderBloc(BlocBuilderState initialState) : super(initialState) {
    on<InitBlocBuilder>(_initBloc);
    on<StartTimer>(_startTimer);
    on<StopTimer>(_stopTimer);
    on<ResetTimer>(_resetBloc);
  }

  Future<void> _initBloc(
    BlocBuilderEvent event,
    Emitter<BlocBuilderState> emit,
  ) async {
    emit(const BlocBuilderState(0, false));
  }

  Future<void> _startTimer(
    BlocBuilderEvent event,
    Emitter<BlocBuilderState> emit,
  ) async {
    StopwatchUtils().start(key: 'bloc_builder_stopper', description: 'bloc_builder_stopper');
    emit(state.copyWith(isTimerActive: true));
  }

  Future<void> _stopTimer(
    BlocBuilderEvent event,
    Emitter<BlocBuilderState> emit,
  ) async {
    final int timer = StopwatchUtils().stop(key: 'bloc_builder_stopper') ?? 0;
    emit(state.copyWith(isTimerActive: false, counter: timer));
  }

  Future<void> _resetBloc(
    BlocBuilderEvent event,
    Emitter<BlocBuilderState> emit,
  ) async {
    emit(state.copyWith(counter: 0, isTimerActive: false));
  }
}
