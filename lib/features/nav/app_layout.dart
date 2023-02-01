import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gdg_organizers_app/features/nav/bloc/cubit.dart';
import 'package:gdg_organizers_app/features/nav/bloc/states.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constants/icon_broken.dart';
import '../../shared/widgets/bug_description.dart';
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
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                appCubit.appBarTitles[appCubit.currentIndex],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: BugDescription(),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF4285F4),
                    child: Icon(
                      IconBroken.Notification,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/Janet.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: appCubit.screens[appCubit.currentIndex],
            bottomNavigationBar: Container(
              height: 66,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                color: Color(0xFF4285F4),
              ),
              child: SalomonBottomBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
                currentIndex: appCubit.currentIndex,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                onTap: (value) {
                  appCubit.changeIndex(value);
                },
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(
                      IconBroken.Home,
                      size: 25,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      IconBroken.Edit_Square,
                      size: 25,
                    ),
                    title: const Text(
                      "Tasks",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      IconBroken.Calendar,
                      size: 25,
                    ),
                    title: const Text(
                      "Events",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      IconBroken.Setting,
                      size: 25,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
