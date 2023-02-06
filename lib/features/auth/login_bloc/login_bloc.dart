import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import '../../../logic/auth_bloc/auth_bloc.dart';
import '../services/authapi.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo _authRepo;
  final AuthBloc authBloc;
  LoginBloc(this.authBloc, this._authRepo) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) {
      event.map(login: _login);
    });
  }
  FutureOr<void> _login(
    LoginEvent event,
  ) async {
    try {
      emit(const LoginState.loading());
      print('loading');
      await _authRepo.login(event.email, event.password).then((value) {
        print(value.body);
        if (value.statusCode == 200) {
          emit(LoginState.success());
          authBloc.add(AuthEvent.loggedIn(
            value.body,
            jsonDecode(value.body)['data']['token'],
          ));
        } else {
          emit(LoginState.failure(jsonDecode(value.body)['error']));
        }
      });
    } on Exception catch (e) {
      print(e);
      emit(LoginState.failure(e.toString()));
    } catch (e) {
      print(e);
      emit(LoginState.failure(e.toString()));
    }
  }
}
