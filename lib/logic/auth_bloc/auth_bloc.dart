import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/services/authapi.dart';
import '../../models/user/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(const _Initial()) {
    on<AuthEvent>((event, emit) {
      event.map(
          appstarted: _onAppStarted,
          loggedIn: _onLoggedIn,
          loggedOut: _onLoggedOut,
          updateuser: _onUpdateUser);
    });
  }

  FutureOr<void> _onAppStarted(
    _AppStarted event,
  ) async {
    try {
              emit(const _Loading());

      final token = await _authRepo.getToken();
      if (token != null) {
        final Response response = await AuthRepo.getUser(token);
        print(response.data['user']);
        setuser(response.data['user']);
      } else {
        emit(const _Unauthenticated());
      }
    } catch (e) {
      print(e);
      emit(const _Failure('Something went wrong'));
    }
  }

  FutureOr<void> _onLoggedIn(
    _LoggedIn event,
  ) async {
    try {
      emit(const _Loading());

      await _authRepo
          .persistData(event.token)
          .then((value) => setuser(event.data));
    } catch (e) {
      print(e);
      emit(const _Unauthenticated());
    }
  }

  FutureOr<void> _onLoggedOut(
    _LoggedOut event,
  ) async {
    try {
      emit(const _Loading());
      await _authRepo.deleteData();
      emit(const _Unauthenticated());
    } catch (e) {
      print(e);
      emit(const _Unauthenticated());
    }
  }

  FutureOr<void> _onUpdateUser(
    _UpdateUser event,
  ) async {
    try {
      setuser(event.data);
    } catch (e) {
      print(e);
      emit(const _Unauthenticated());
    }
  }

  void setuser(Map<String, dynamic> data) {
    _user = User.fromJson(data);
    emit(_Authenticated(user));
  }

  User _user = const User(
    email: '',
    firstname: '',
    lastname: '',
  );

  User get user => _user;
}
