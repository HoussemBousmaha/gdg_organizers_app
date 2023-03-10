import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../logic/auth_bloc/auth_bloc.dart';
import '../../../shared/services/notification.dart';
import '../services/authapi.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  LoginBloc(
    this.authBloc,
  ) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) {
      event.map(login: _login);
    });
  }
  FutureOr<void> _login(
    LoginEvent event,
  ) async {
    Response? res;
    try {
      emit(const LoginState.loading());
      res = await AuthRepo.login(event.email, event.password);
      if (res.statusCode != 201) {
        emit(LoginState.failure(res.data['error']));
        return;
      }
      emit(const LoginState.success());
      authBloc.add(AuthEvent.loggedIn(
        res.data['user'],
        res.data['token'],
      ));
      FirebaseMessaging.instance.getToken().then((value) {
        AuthRepo.updateFcmtoken(value ?? '', res!.data['token']);
      });

      NotificationServices.joinchannel();
    } catch (e) {
      emit(LoginState.failure(res != null ? res.data['error'] ?? 'Login Failed' : 'Login Failed'));
      print(e);
    }
  }
}
