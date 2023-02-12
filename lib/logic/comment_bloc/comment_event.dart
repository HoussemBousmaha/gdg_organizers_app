part of 'comment_bloc.dart';

@freezed
class CommentEvent with _$CommentEvent {
  const factory CommentEvent.connect(String userId, String channelId) = _GetComments;
  const factory CommentEvent.sendComment(String comment) = _SendComment;
  const factory CommentEvent.recieveComment(Comment comment) = _RecieveComment;
}
