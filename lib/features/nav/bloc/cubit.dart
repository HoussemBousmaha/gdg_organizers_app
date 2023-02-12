import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../events/screens/events_screen.dart';
import '../../home/home_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../tasks/tasks_screen.dart';
import 'states.dart';

class NavigationCubit extends Cubit<NavigationStates> {
  NavigationCubit() : super(NavigationInitialState());

  static NavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const TasksScreen(),
    const EventsScreen(),
    const SettingsScreen(),
  ];

  List<String> appBarTitles = [
    'Home',
    'Tasks',
    'UpComing Events',
    'Settings',
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavBarChangeState());
  }
}
