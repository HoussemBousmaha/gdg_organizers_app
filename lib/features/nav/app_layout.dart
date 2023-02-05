import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/features/nav/bloc/cubit.dart';
import 'package:gdg_organizers_app/features/nav/bloc/states.dart';
import 'package:gdg_organizers_app/shared/widgets/customAppBar.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constants/icon_broken.dart';
import '../../shared/widgets/bug_description.dart';
import '../../shared/widgets/feedback.dart';
import '../../shared/widgets/logout_pop_up.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDialOpen = ValueNotifier<bool>(false);
    return BlocConsumer<NavigationCubit, NavigationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NavigationCubit appCubit = NavigationCubit.get(context);
        return WillPopScope(
          onWillPop: () async {
            if (isDialOpen.value) {
              isDialOpen.value = false;
              return false;
            }
            return true;
          },
          child: Scaffold(
            floatingActionButton: SpeedDial(
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.qr_code_2),
                  backgroundColor: const Color(0xFF4285F4),
                  foregroundColor: Colors.white,
                  onTap: () {},
                ),
                SpeedDialChild(
                  child: const Icon(Icons.call),
                  backgroundColor: const Color(0xFF4285F4),
                  foregroundColor: Colors.white,
                  onTap: () {},
                ),
                SpeedDialChild(
                  child: const Icon(Icons.map),
                  backgroundColor: const Color(0xFF4285F4),
                  foregroundColor: Colors.white,
                  onTap: () {},
                ),
              ],
              activeIcon: Icons.close,
              openCloseDial: isDialOpen,
              backgroundColor: Color(0xFF4285F4),
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
            appBar: CustomAppBar(
              currentIndex: appCubit.currentIndex,
              title: appCubit.appBarTitles[appCubit.currentIndex],
            ),
            body: appCubit.screens[appCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kBlue,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                appCubit.changeIndex(value);
              },
              currentIndex: appCubit.currentIndex,
              items: const [
                BottomNavigationBarItem(
                    label: 'home', icon: Icon(IconBroken.Home)),
                BottomNavigationBarItem(
                    label: 'task', icon: Icon(IconBroken.Activity)),
                BottomNavigationBarItem(
                    label: 'events', icon: Icon(IconBroken.Calendar)),
                BottomNavigationBarItem(
                    label: 'Settengs', icon: Icon(IconBroken.Setting)),
              ],
            ),
          ),
        );
      },
    );
  }
}
