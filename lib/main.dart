import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'constants/theme.dart';
import 'features/auth/login_bloc/login_bloc.dart';
import 'features/auth/screens/authscreen.dart';
import 'features/events/cubit/event_cubit.dart';
import 'features/events/screens/event_details.dart';
import 'features/game/game_screen.dart';
import 'features/home/loading.dart';
import 'features/home/post_cubit/posts_cubit.dart';
import 'features/nav/app_layout.dart';
import 'features/nav/bloc/cubit.dart';
import 'features/notification/notification_screen.dart';
import 'features/settings/screens/editprofilescreen.dart';
import 'features/tasks/task_cubit/task_cubit.dart';
import 'logic/auth_bloc/auth_bloc.dart';
import 'logic/bloc_observer.dart';
import 'logic/comment_bloc/comment_bloc.dart';
import 'logic/imagecubit.dart';
import 'logic/user_bloc/user_bloc.dart';
import 'models/user/user.dart';
import 'shared/services/diohelper.dart';
import 'shared/services/notification.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  NotificationServices.initializenotification(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthBloc authBloc;
  late UserBloc userBloc;

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
        BlocProvider(create: (context) => authBloc),
        BlocProvider(create: (context) => LoginBloc(authBloc)),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => ImageCubit()),
        BlocProvider(create: (context) => userBloc),
        BlocProvider(create: (context) => EventCubit()),
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => PostsCubit()),
        BlocProvider(create: (context) => CommentBloc(authBloc)),
      ],
      child: MaterialApp(
        routes: {
          EditProfile.routeName: (_) => EditProfile(),
          EventsDetails.routeName: (_) => const EventsDetails(),
          Notifications.routeName: (_) => const Notifications(),
          BrainyGame.routeName: (context) => const BrainyGame(),
        },
        theme: AppTheme.light(),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.when(initial: () {
              return const SizedBox.shrink();
            }, loading: () {
              FlutterNativeSplash.remove();

              return const LoadingScreen();
            }, authenticated: (User user) {
              return const LayoutScreen();
            }, unauthenticated: () {
              return const AuthScreen();
            }, failure: (String message) {
              return const AuthScreen();
            });
          },
        ),
      ),
    );
  }
}
