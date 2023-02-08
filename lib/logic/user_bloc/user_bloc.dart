import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gdg_organizers_app/features/auth/services/authapi.dart';
import 'package:gdg_organizers_app/logic/auth_bloc/auth_bloc.dart';
import 'package:gdg_organizers_app/shared/services/diohelper.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthBloc authBloc;
  UserBloc(this.authBloc, ) : super(_Initial()) {
    on<UserEvent>((event, emit) {
      event.map(
          updateUser: _onUpdateUser,
          updateUserImage: _onUpdateUserImage,
          updateUserPassword: _onUpadteUserPassword);
    });
  }

  FutureOr<void> _onUpdateUser(_UpdateUser event) async {
    try {} catch (e) {}
  }

  FutureOr<void> _onUpdateUserImage(_UpdateUserImage event) async {
    try {
      final token = await AuthRepo.getToken();
      if (token != null) {
        final res = await AuthRepo.updateimage(event.path, token);
        print(res);
        authBloc.add(AuthEvent.updateuser(res['user']));
        emit(UserState.success());
      } else {
        emit(UserState.failure('Token not found'));
      }
    } catch (e) {
      emit(UserState.failure(e.toString()));
    }
  }

  FutureOr<void> _onUpadteUserPassword(_UpdateUserPassword event) async {
    try {} catch (e) {}
  }
}
