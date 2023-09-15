import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_app/bloc/bloc_builder_bloc/bloc_builder_event.dart';
import 'package:clean_app/bloc/bloc_builder_bloc/bloc_builder_state.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';

class BlocListenerBloc extends Bloc<BlocListenerEvent, BlocListenerState> {
  BlocListenerBloc(BlocListenerState initialState) : super(initialState) {
    on<InitBlocBuilder>(_initBloc);
    on<StartTimer>(_startTimer);
    on<StopTimer>(_stopTimer);
    on<ResetTimer>(_resetBloc);
  }

  Future<void> _initBloc(
    BlocListenerEvent event,
    Emitter<BlocListenerState> emit,
  ) async {
    emit(const BlocListenerState(0, false));
  }

  Future<void> _startTimer(
    BlocListenerEvent event,
    Emitter<BlocListenerState> emit,
  ) async {
    StopwatchUtils().start(key: 'bloc_builder_stopper', description: 'bloc_builder_stopper');
    emit(state.copyWith(isTimerActive: true));
  }

  Future<void> _stopTimer(
    BlocListenerEvent event,
    Emitter<BlocListenerState> emit,
  ) async {
    final int timer = StopwatchUtils().stop(key: 'bloc_builder_stopper') ?? 0;
    emit(state.copyWith(isTimerActive: false, counter: timer));
  }

  Future<void> _resetBloc(
    BlocListenerEvent event,
    Emitter<BlocListenerState> emit,
  ) async {
    emit(state.copyWith(counter: 0, isTimerActive: false));
  }
}
