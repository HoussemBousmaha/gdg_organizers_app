import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/screens/events_screen.dart';
import 'package:gdg_organizers_app/screens/home_screen.dart';
import 'package:gdg_organizers_app/screens/settings_screen.dart';
import 'package:gdg_organizers_app/shared/bloc/states.dart';

import '../../screens/tasks_screen.dart';
import '../components/task_widget.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
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
