import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/theme.dart';
import 'package:gdg_organizers_app/features/auth/login_bloc/login_bloc.dart';
import 'package:gdg_organizers_app/features/auth/screens/authscreen.dart';
import 'package:gdg_organizers_app/features/events/cubit/event_cubit.dart';
import 'package:gdg_organizers_app/features/nav/app_layout.dart';
import 'package:gdg_organizers_app/features/settings/screens/editprofilescreen.dart';
import 'package:gdg_organizers_app/logic/auth_bloc/auth_bloc.dart';
import 'package:gdg_organizers_app/logic/bloc_observer.dart';
import 'package:gdg_organizers_app/features/nav/bloc/cubit.dart';
import 'package:gdg_organizers_app/logic/user_bloc/user_bloc.dart';
import 'package:gdg_organizers_app/shared/services/diohelper.dart';
import 'features/home/loading.dart';
import 'logic/imagecubit.dart';
import 'models/user/user.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthBloc authBloc;
    late  UserBloc userBloc ;


  @override
  void initState() {
    DioHelper.init();
    authBloc = AuthBloc();
    userBloc = UserBloc(authBloc);
    authBloc.add(const AuthEvent.appstarted());
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => authBloc,
        ),
        BlocProvider(
          create: (context) => LoginBloc(authBloc,),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(create: (context) => ImageCubit()),
        BlocProvider(create: (context) => userBloc),
        BlocProvider(create: (context) => EventCubit())
      ],
      child: MaterialApp(
          routes: {
            '/editprofile': (_) => const EditProfile(),
          },
          theme: AppTheme.light(),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state.when(initial: () {
                return const LoadingScreen();
              }, loading: () {
                return const LoadingScreen();
              }, authenticated: (User user) {
                return const LayoutScreen();
              }, unauthenticated: () {
                return AuthScreen();
              }, failure: (String message) {
                return AuthScreen();
              });
            },
          )),
    );
  }
}
