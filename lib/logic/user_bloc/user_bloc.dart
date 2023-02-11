import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gdg_organizers_app/features/auth/services/authapi.dart';
import 'package:gdg_organizers_app/logic/auth_bloc/auth_bloc.dart';
import 'package:gdg_organizers_app/shared/services/diohelper.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthBloc authBloc;
  UserBloc(
    this.authBloc,
  ) : super(const _Initial()) {
    on<UserEvent>((event, emit) {
      event.map(
          updateUser: _onUpdateUser,
          updateUserImage: _onUpdateUserImage,
          updateUserPassword: _onUpadteUserPassword,
          sendFeedback: _onSendFeedback);
    });
  }

  FutureOr<void> _onSendFeedback(_SendFeedback event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.getToken();
      print(token);
      if (token != null) {
        final res =
            await AuthRepo.sendFeedback(token, event.rating, event.feedback);

        print(res.data);
        if (res.statusCode == 201) {
          emit(const UserState.success());
        } else {
          emit(UserState.failure(res.data['error'] ?? 'Something went wrong'));
        }
      } else {
        emit(const UserState.failure('Token not found'));
      }
    } catch (e) {
      emit(UserState.failure(e.toString()));
    }
  }

  FutureOr<void> _onUpdateUser(_UpdateUser event) async {
    final String? token = await AuthRepo.getToken();
    if (token == null) {
      emit(const UserState.failure('Token not found'));
    }
    if (token != null) {
      try {
        emit(const UserState.loading());
        final res = await AuthRepo.updateUser(token, event.data);
        if (res.statusCode == 200) {
          authBloc.add(AuthEvent.updateuser(res.data['user']));
          emit(const UserState.success());
        } else {
          emit(UserState.failure(res.data['error'] ?? 'Something went wrong'));
        }
      } catch (e) {
        emit(UserState.failure(e.toString()));
      }
    } else {
      emit(const UserState.failure('Token not found'));
    }
  }

  FutureOr<void> _onUpdateUserImage(_UpdateUserImage event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.getToken();
      if (token != null) {
        final res = await AuthRepo.updateimage(event.path, token);
        authBloc.add(AuthEvent.updateuser(res['user']));
        emit(const UserState.success());
      } else {
        emit(const UserState.failure('Token not found'));
      }
    } catch (e) {
      emit(UserState.failure(e.toString()));
    }
  }

  FutureOr<void> _onUpadteUserPassword(_UpdateUserPassword event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.getToken();
      if (token != null) {
        final res = await AuthRepo.updatePassword(token, event.oldpassword , event.newpassword);
        if (res.statusCode == 200) {
          emit(const UserState.success());
        } else {
          emit(UserState.failure(res.data['error'] ?? 'Something went wrong'));
        }
      } else {
        emit(const UserState.failure('Token not found'));
      }
    } catch (e) {
      emit(UserState.failure(e.toString()));
    } catch (e) {}
  }
}
