import 'package:clean_app/cubit/navigation_cubit/navigation_state.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.empty());

  void navigate(NavigationScreens screen) {
    final NavigationState updatedState = state.copyWith(
      currentScreen: screen,
    );
    emit(updatedState);
  }
}
