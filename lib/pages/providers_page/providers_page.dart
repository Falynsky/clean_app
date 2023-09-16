import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/pages/providers_page/providers_page_content.dart';
import 'package:clean_app/pages/providers_page/test_provider.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersPage extends StatelessWidget {
  const ProvidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationCubit navigationCubit = context.read<NavigationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'providers_page_draw');
    });
    StopwatchUtils().start(key: 'providers_page_draw');
    return Scaffold(
      appBar: AppBar(
        title: const Text('just_stateful_widget_page'),
      ),
      body: WillPopScope(
        onWillPop: () => onWillPop(navigationCubit),
        child: ChangeNotifierProvider<TestProvider>(
          create: (_) => TestProvider(),
          child: const ProvidersPageContent(),
        ),
      ),
    );
  }

  Future<bool> onWillPop(NavigationCubit navigationCubit) async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
