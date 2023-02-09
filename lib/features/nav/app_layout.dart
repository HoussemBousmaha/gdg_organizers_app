import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/features/events/cubit/event_cubit.dart';
import 'package:gdg_organizers_app/features/events/models/event.dart';
import 'package:gdg_organizers_app/features/home/post_cubit/posts_cubit.dart';
import 'package:gdg_organizers_app/features/nav/bloc/cubit.dart';
import 'package:gdg_organizers_app/features/nav/bloc/states.dart';
import 'package:gdg_organizers_app/features/tasks/task_cubit/task_cubit.dart';
import 'package:gdg_organizers_app/logic/user_bloc/user_bloc.dart';
import 'package:gdg_organizers_app/shared/widgets/customAppBar.dart';
import 'package:gdg_organizers_app/shared/widgets/gdgLogo.dart';
import 'package:gdg_organizers_app/shared/widgets/loading.dart';
import 'package:iconsax/iconsax.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constants/icon_broken.dart';
import '../../shared/widgets/bug_description.dart';
import '../../shared/widgets/feedback.dart';
import '../../shared/widgets/logout_pop_up.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    context.read<EventCubit>().getEvents();
    context.read<TaskCubit>().getTasks();
    context.read<PostsCubit>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDialOpen = ValueNotifier<bool>(false);
    return BlocBuilder<NavigationCubit, NavigationStates>(
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
          child: Stack(
            children: [
              Scaffold(
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
                  child: const Icon(
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
                        label: 'home', icon: Icon(Iconsax.home)),
                    BottomNavigationBarItem(
                        label: 'task', icon: Icon(Iconsax.activity)),
                    BottomNavigationBarItem(
                        label: 'events', icon: Icon(Iconsax.calendar)),
                    BottomNavigationBarItem(
                        label: 'Settengs', icon: Icon(Iconsax.setting)),
                  ],
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) => state.maybeMap(
                      orElse: () => const SizedBox.shrink(),
                      loading: (value) => const Loading()))
            ],
          ),
        );
      },
    );
  }
}
