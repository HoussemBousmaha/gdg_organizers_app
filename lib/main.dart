import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/screens/app_layout.dart';
import 'package:gdg_organizers_app/shared/bloc/bloc_observer.dart';
import 'package:gdg_organizers_app/shared/bloc/cubit.dart';

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
          create: (context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF4285F4),
          fontFamily: 'OpenSans',
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: LayoutScreen(),
      ),
    );
  }
}
