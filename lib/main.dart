import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/theme.dart';
import 'package:gdg_organizers_app/features/auth/screens/authscreen.dart';
import 'package:gdg_organizers_app/features/nav/app_layout.dart';
import 'package:gdg_organizers_app/logic/bloc_observer.dart';
import 'package:gdg_organizers_app/features/nav/bloc/cubit.dart';

import 'models/user/user.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.light(),
        debugShowCheckedModeBanner: false,
        home: LayoutScreen(),
      ),
    );
  }
}
