import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/cubit/navigation_cubit/navigation_state.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/pages/bloc_builder/bloc_builder_page.dart';
import 'package:clean_app/pages/bloc_with_stateful_widget_page/bloc_with_stateful_widget_page.dart';
import 'package:clean_app/pages/home_page/home_page.dart';
import 'package:clean_app/pages/list_view_page/list_view_page.dart';
import 'package:clean_app/pages/paddings_page/paddings_page.dart';
import 'package:clean_app/pages/providers_page/providers_page.dart';
import 'package:clean_app/pages/sized_box_page/sized_box_page.dart';
import 'package:clean_app/pages/stateful_widget_page/stateful_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenResolver extends StatefulWidget {
  const ScreenResolver({Key? key}) : super(key: key);

  @override
  State<ScreenResolver> createState() => _ScreenResolverState();
}

class _ScreenResolverState extends State<ScreenResolver> {
  late final NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = NavigationCubit();
  }

  @override
  void dispose() {
    super.dispose();
    navigationCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (_) => navigationCubit,
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (BuildContext context, NavigationState state) {
          if (state.currentScreen == NavigationScreens.home) {
            return const HomePage();
          } else if (state.currentScreen == NavigationScreens.listViewBuilder) {
            return const ListViewBuilderPage();
          } else if (state.currentScreen == NavigationScreens.statelessWidget) {
            return const StatelessWidgetPage();
          } else if (state.currentScreen == NavigationScreens.blocListener) {
            return const BlocListenerPage();
          } else if (state.currentScreen == NavigationScreens.container) {
            return ContainerPage();
          } else if (state.currentScreen == NavigationScreens.paddings) {
            return PaddingsPage();
          } else if (state.currentScreen == NavigationScreens.blocWithStatefulWidget) {
            return const BlocWithStatefulWidgetPage();
          } else if (state.currentScreen == NavigationScreens.provider) {
            return const ProvidersPage();
          } else {
            return InkWell(
              onTap: () => navigationCubit.navigate(NavigationScreens.home),
              child: ColoredBox(
                color: Colors.red,
                child: Text(NavigationScreens.values.toString()),
              ),
            );
          }
        },
      ),
    );
  }
}
