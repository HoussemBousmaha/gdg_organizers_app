import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/features/events/events_screen.dart';
import 'package:gdg_organizers_app/features/home/home_screen.dart';
import 'package:gdg_organizers_app/features/settings/screens/settings_screen.dart';
import 'package:gdg_organizers_app/features/nav/bloc/states.dart';

import '../../tasks/tasks_screen.dart';

class NavigationCubit extends Cubit<NavigationStates> {
  NavigationCubit() : super(NavigationInitialState());

  static NavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    TasksScreen(),
    EventsScreen(),
    SettingsScreen(),
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
