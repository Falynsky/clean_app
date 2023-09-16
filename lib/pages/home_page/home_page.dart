import 'package:clean_app/component/screen_button.dart';
import 'package:clean_app/component/screen_button_list.dart';
import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBottomMenu = false;
  double threshold = 100;
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.only(top: 19),
      child: Column(
        children: <Widget>[
          appToolbar(),
          const SizedBox(height: 26),
          Expanded(
            child: ScreenButtonList(
              buttons: <Widget>[
                ScreenButton(
                  caption: '1./13. ListViewBuilder()',
                  onTap: () => navigationCubit.navigate(NavigationScreens.listViewBuilder),
                ),
                ScreenButton(
                  caption: '2. StatelessWidget()',
                  onTap: () => navigationCubit.navigate(NavigationScreens.statelessWidget),
                ),
                ScreenButton(
                  caption: '3. BlocListener()',
                  onTap: () => navigationCubit.navigate(NavigationScreens.blocListener),
                ),
                ScreenButton(
                  caption: '4. ContainerPage',
                  onTap: () => navigationCubit.navigate(NavigationScreens.container),
                ),
                ScreenButton(
                  caption: '5. PaddingsPage',
                  onTap: () => navigationCubit.navigate(NavigationScreens.paddings),
                ),
                ScreenButton(
                  caption: '10. widget with BLoC',
                  onTap: () => navigationCubit.navigate(NavigationScreens.blocWithStatefulWidget),
                ),
                ScreenButton(
                  caption: '11. provider',
                  onTap: () => navigationCubit.navigate(NavigationScreens.provider),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding appToolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/face_man.svg',
                width: 45,
                height: 45,
              ),
              const SizedBox(width: 7),
              Text(
                'Hi, Falu',
                style: GoogleFonts.comfortaa(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Icon(Icons.dashboard_customize_outlined),
        ],
      ),
    );
  }
}
