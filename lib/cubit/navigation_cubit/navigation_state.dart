import 'package:equatable/equatable.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';

class NavigationState extends Equatable {
  final NavigationScreens currentScreen;

  const NavigationState({
    required this.currentScreen,
  });

  factory NavigationState.empty() {
    return const NavigationState(currentScreen: NavigationScreens.home);
  }

  NavigationState copyWith({
    NavigationScreens? currentScreen,
  }) {
    return NavigationState(
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }

  @override
  List<Object> get props => <Object>[currentScreen];
}
