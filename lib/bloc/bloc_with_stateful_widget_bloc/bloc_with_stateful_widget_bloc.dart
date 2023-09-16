import 'package:clean_app/bloc/bloc_with_stateful_widget_bloc/bloc_with_stateful_widget_event.dart';
import 'package:clean_app/bloc/bloc_with_stateful_widget_bloc/bloc_with_stateful_widget_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWithStatefulWidgetBloc extends Bloc<BlocWithStatefulWidgetEvent, BlocWithStatefulWidgetState> {
  BlocWithStatefulWidgetBloc(BlocWithStatefulWidgetState initialState) : super(initialState) {
    on<GetCurrentDate>(_getCurrentDate);
  }

  Future<void> _getCurrentDate(
    BlocWithStatefulWidgetEvent event,
    Emitter<BlocWithStatefulWidgetState> emit,
  ) async {
    emit(state.copyWith(dateTime: DateTime.now().toString()));
  }
}
