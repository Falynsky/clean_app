import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_state.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.empty());

  void navigate(NavigationScreens screen) {
    final NavigationState updatedState = state.copyWith(
      currentScreen: screen,
    );
    emit(updatedState);
  }
}
