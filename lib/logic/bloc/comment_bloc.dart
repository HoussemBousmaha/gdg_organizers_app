import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gdg_organizers_app/models/comments/comment.dart';

part 'comment_event.dart';
part 'comment_state.dart';
part 'comment_bloc.freezed.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(const _Initial()) {
    on<CommentEvent>((event, emit) {
      event.map(
        getComments: _onGetComments,
        sendComment: _onSendComment,
        recieveComment: _onRecieveComment,
      );
    });
  }

  FutureOr<void> _onGetComments(_GetComments event) async {
    

  }
  FutureOr<void> _onSendComment(_SendComment event) async {}
  FutureOr<void> _onRecieveComment(_RecieveComment event) async {}
}
