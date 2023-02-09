import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gdg_organizers_app/logic/auth_bloc/auth_bloc.dart';
import 'package:gdg_organizers_app/models/comments/comment.dart';

import '../../shared/services/socket_io.dart';

part 'comment_event.dart';
part 'comment_state.dart';
part 'comment_bloc.freezed.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final AuthBloc authBloc;
  List<Comment> comments = [];
  CommentBloc(this.authBloc, this.comments) : super(const _Initial()) {
    on<CommentEvent>((event, emit) {
      event.map(
        connect: _onConnect,
        sendComment: _onSendComment,
        recieveComment: _onRecieveComment,
      );
    });
  }

  FutureOr<void> _onConnect(_GetComments event) async {
    emit(const _Initial());
    try {
      WebSocketServices.connect(
        event.userId,
        event.channelId,
      );
      WebSocketServices.socket.on('comment', (data) {
        add(_RecieveComment(Comment.fromJson(data)));
      });

      emit(CommentState.success(comments));
    } catch (e) {
      print(e);
      emit(const CommentState.failure('Something went wrong!'));
    }
  }

  FutureOr<void> _onSendComment(_SendComment event) async {
    try {
      var comment = Comment(
          content: event.comment,
          sender: authBloc.user,
          createdAt: DateTime.now().toIso8601String());
      comments = [comment, ...comments];
      emit(CommentState.success(comments));
      WebSocketServices.socket.emit('comment', comment.toJson());
    } catch (e) {
      print(e);
      emit(const CommentState.failure('Something went wrong!'));
    }
  }

  FutureOr<void> _onRecieveComment(_RecieveComment event) async {
    if (event.comment.sender!.id == authBloc.user.id) {
      return;
    } else {
      try {
        comments = [event.comment, ...comments];
        emit(CommentState.success(comments));
      } catch (e) {
        print(e);
        emit(const CommentState.failure('Something went wrong!'));
      }
    }
  }
}
