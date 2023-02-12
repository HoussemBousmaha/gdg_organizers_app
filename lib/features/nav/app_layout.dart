import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/const.dart';
import '../../logic/user_bloc/user_bloc.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/loading.dart';
import '../../shared/widgets/logout_pop_up.dart';
import '../events/cubit/event_cubit.dart';
import '../game/game_screen.dart';
import '../home/post_cubit/posts_cubit.dart';
import '../tasks/task_cubit/task_cubit.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

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
              BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  state.maybeMap(
                      orElse: () {},
                      failure: (value) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              content: ErrorPopUp(
                                error: value.message,
                              ),
                            );
                          },
                        );
                      },
                      success: (state) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              content: SuccessPopup(),
                            );
                          },
                        );
                      });
                },
                child: Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(BrainyGame.routeName);
                    },
                    child: const Icon(Iconsax.game),
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
                      BottomNavigationBarItem(label: 'home', icon: Icon(Iconsax.home)),
                      BottomNavigationBarItem(label: 'task', icon: Icon(Iconsax.activity)),
                      BottomNavigationBarItem(label: 'events', icon: Icon(Iconsax.calendar)),
                      BottomNavigationBarItem(label: 'Settengs', icon: Icon(Iconsax.setting)),
                    ],
                  ),
                ),
              ),
              BlocBuilder<UserBloc, UserState>(builder: (context, state) => state.maybeMap(orElse: () => const SizedBox.shrink(), loading: (value) => const Loading()))
            ],
          ),
        );
      },
    );
  }
}
