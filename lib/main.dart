import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/theme.dart';
import 'package:gdg_organizers_app/features/auth/login_bloc/login_bloc.dart';
import 'package:gdg_organizers_app/features/auth/screens/authscreen.dart';
import 'package:gdg_organizers_app/features/auth/services/authapi.dart';
import 'package:gdg_organizers_app/features/nav/app_layout.dart';
import 'package:gdg_organizers_app/features/settings/screens/editprofilescreen.dart';
import 'package:gdg_organizers_app/logic/auth_bloc/auth_bloc.dart';
import 'package:gdg_organizers_app/logic/bloc_observer.dart';
import 'package:gdg_organizers_app/features/nav/bloc/cubit.dart';
import 'package:gdg_organizers_app/shared/widgets/customAppBar.dart';

import 'features/home/loading.dart';
import 'logic/imagecubit.dart';
import 'models/user/user.dart';

void main() {
  final AuthRepo authRepo = AuthRepo();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(authRepo));
}

class MyApp extends StatefulWidget {
  const MyApp(this.authRepo, {Key? key}) : super(key: key);
  final AuthRepo authRepo;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthBloc authBloc;
  get authRepo => widget.authRepo;

  @override
  void initState() {
    authBloc = AuthBloc(authRepo);
    authBloc.add(const AuthEvent.appstarted());
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
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
          create: (context) => LoginBloc(authBloc, authRepo),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(create: (context) => ImageCubit())
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
