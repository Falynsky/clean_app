import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unclean_app/component/screen_button.dart';
import 'package:unclean_app/component/screen_button_list.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';

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
                  caption: '1./13. ListView()',
                  onTap: () => navigationCubit.navigate(NavigationScreens.listView),
                ),
                ScreenButton(
                  caption: '2. StatefulWidget()',
                  onTap: () => navigationCubit.navigate(NavigationScreens.statefulWidget),
                ),
                ScreenButton(
                  caption: '3. BlocBuilder()',
                  onTap: () => navigationCubit.navigate(NavigationScreens.blocBuilder),
                ),
                ScreenButton(
                  caption: '4./5. SizedBox',
                  onTap: () => navigationCubit.navigate(NavigationScreens.sizedBox),
                ),
                ScreenButton(
                  caption: '10./11. widget with BLoC',
                  onTap: () => navigationCubit.navigate(NavigationScreens.justStatefulWidget),
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
