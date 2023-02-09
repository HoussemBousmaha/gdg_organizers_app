part of 'comment_bloc.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState.initial() = _Initial;
  const factory CommentState.loading() = _Loading;
  const factory CommentState.success(List<Comment> comments) = _Success;
  const factory CommentState.failure(String message) = _Failure;
  const factory CommentState.newComment(List<Comment> comments) = _NewComment;
}
