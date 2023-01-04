import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/shared/bloc/cubit.dart';
import 'package:gdg_organizers_app/shared/bloc/states.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return Scaffold(
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
                  icon: const Icon(Icons.home),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.add_task),
                  title: const Text(
                    "Tasks",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.event),
                  title: const Text(
                    "Events",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text(
                    "Settings",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
