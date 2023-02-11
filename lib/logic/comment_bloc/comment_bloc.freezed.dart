// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String channelId) connect,
    required TResult Function(String comment) sendComment,
    required TResult Function(Comment comment) recieveComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String channelId)? connect,
    TResult? Function(String comment)? sendComment,
    TResult? Function(Comment comment)? recieveComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String channelId)? connect,
    TResult Function(String comment)? sendComment,
    TResult Function(Comment comment)? recieveComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) connect,
    required TResult Function(_SendComment value) sendComment,
    required TResult Function(_RecieveComment value) recieveComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? connect,
    TResult? Function(_SendComment value)? sendComment,
    TResult? Function(_RecieveComment value)? recieveComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? connect,
    TResult Function(_SendComment value)? sendComment,
    TResult Function(_RecieveComment value)? recieveComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEventCopyWith<$Res> {
  factory $CommentEventCopyWith(
          CommentEvent value, $Res Function(CommentEvent) then) =
      _$CommentEventCopyWithImpl<$Res, CommentEvent>;
}

/// @nodoc
class _$CommentEventCopyWithImpl<$Res, $Val extends CommentEvent>
    implements $CommentEventCopyWith<$Res> {
  _$CommentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetCommentsCopyWith<$Res> {
  factory _$$_GetCommentsCopyWith(
          _$_GetComments value, $Res Function(_$_GetComments) then) =
      __$$_GetCommentsCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String channelId});
}

/// @nodoc
class __$$_GetCommentsCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$_GetComments>
    implements _$$_GetCommentsCopyWith<$Res> {
  __$$_GetCommentsCopyWithImpl(
      _$_GetComments _value, $Res Function(_$_GetComments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? channelId = null,
  }) {
    return _then(_$_GetComments(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetComments implements _GetComments {
  const _$_GetComments(this.userId, this.channelId);

  @override
  final String userId;
  @override
  final String channelId;

  @override
  String toString() {
    return 'CommentEvent.connect(userId: $userId, channelId: $channelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetComments &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, channelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCommentsCopyWith<_$_GetComments> get copyWith =>
      __$$_GetCommentsCopyWithImpl<_$_GetComments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String channelId) connect,
    required TResult Function(String comment) sendComment,
    required TResult Function(Comment comment) recieveComment,
  }) {
    return connect(userId, channelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String channelId)? connect,
    TResult? Function(String comment)? sendComment,
    TResult? Function(Comment comment)? recieveComment,
  }) {
    return connect?.call(userId, channelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String channelId)? connect,
    TResult Function(String comment)? sendComment,
    TResult Function(Comment comment)? recieveComment,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(userId, channelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) connect,
    required TResult Function(_SendComment value) sendComment,
    required TResult Function(_RecieveComment value) recieveComment,
  }) {
    return connect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? connect,
    TResult? Function(_SendComment value)? sendComment,
    TResult? Function(_RecieveComment value)? recieveComment,
  }) {
    return connect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? connect,
    TResult Function(_SendComment value)? sendComment,
    TResult Function(_RecieveComment value)? recieveComment,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(this);
    }
    return orElse();
  }
}

abstract class _GetComments implements CommentEvent {
  const factory _GetComments(final String userId, final String channelId) =
      _$_GetComments;

  String get userId;
  String get channelId;
  @JsonKey(ignore: true)
  _$$_GetCommentsCopyWith<_$_GetComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendCommentCopyWith<$Res> {
  factory _$$_SendCommentCopyWith(
          _$_SendComment value, $Res Function(_$_SendComment) then) =
      __$$_SendCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String comment});
}

/// @nodoc
class __$$_SendCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$_SendComment>
    implements _$$_SendCommentCopyWith<$Res> {
  __$$_SendCommentCopyWithImpl(
      _$_SendComment _value, $Res Function(_$_SendComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$_SendComment(
      null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendComment implements _SendComment {
  const _$_SendComment(this.comment);

  @override
  final String comment;

  @override
  String toString() {
    return 'CommentEvent.sendComment(comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendComment &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendCommentCopyWith<_$_SendComment> get copyWith =>
      __$$_SendCommentCopyWithImpl<_$_SendComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String channelId) connect,
    required TResult Function(String comment) sendComment,
    required TResult Function(Comment comment) recieveComment,
  }) {
    return sendComment(comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String channelId)? connect,
    TResult? Function(String comment)? sendComment,
    TResult? Function(Comment comment)? recieveComment,
  }) {
    return sendComment?.call(comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String channelId)? connect,
    TResult Function(String comment)? sendComment,
    TResult Function(Comment comment)? recieveComment,
    required TResult orElse(),
  }) {
    if (sendComment != null) {
      return sendComment(comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) connect,
    required TResult Function(_SendComment value) sendComment,
    required TResult Function(_RecieveComment value) recieveComment,
  }) {
    return sendComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? connect,
    TResult? Function(_SendComment value)? sendComment,
    TResult? Function(_RecieveComment value)? recieveComment,
  }) {
    return sendComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? connect,
    TResult Function(_SendComment value)? sendComment,
    TResult Function(_RecieveComment value)? recieveComment,
    required TResult orElse(),
  }) {
    if (sendComment != null) {
      return sendComment(this);
    }
    return orElse();
  }
}

abstract class _SendComment implements CommentEvent {
  const factory _SendComment(final String comment) = _$_SendComment;

  String get comment;
  @JsonKey(ignore: true)
  _$$_SendCommentCopyWith<_$_SendComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RecieveCommentCopyWith<$Res> {
  factory _$$_RecieveCommentCopyWith(
          _$_RecieveComment value, $Res Function(_$_RecieveComment) then) =
      __$$_RecieveCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({Comment comment});

  $CommentCopyWith<$Res> get comment;
}

/// @nodoc
class __$$_RecieveCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res, _$_RecieveComment>
    implements _$$_RecieveCommentCopyWith<$Res> {
  __$$_RecieveCommentCopyWithImpl(
      _$_RecieveComment _value, $Res Function(_$_RecieveComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$_RecieveComment(
      null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res> get comment {
    return $CommentCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value));
    });
  }
}

/// @nodoc

class _$_RecieveComment implements _RecieveComment {
  const _$_RecieveComment(this.comment);

  @override
  final Comment comment;

  @override
  String toString() {
    return 'CommentEvent.recieveComment(comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecieveComment &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecieveCommentCopyWith<_$_RecieveComment> get copyWith =>
      __$$_RecieveCommentCopyWithImpl<_$_RecieveComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String channelId) connect,
    required TResult Function(String comment) sendComment,
    required TResult Function(Comment comment) recieveComment,
  }) {
    return recieveComment(comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String channelId)? connect,
    TResult? Function(String comment)? sendComment,
    TResult? Function(Comment comment)? recieveComment,
  }) {
    return recieveComment?.call(comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String channelId)? connect,
    TResult Function(String comment)? sendComment,
    TResult Function(Comment comment)? recieveComment,
    required TResult orElse(),
  }) {
    if (recieveComment != null) {
      return recieveComment(comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) connect,
    required TResult Function(_SendComment value) sendComment,
    required TResult Function(_RecieveComment value) recieveComment,
  }) {
    return recieveComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? connect,
    TResult? Function(_SendComment value)? sendComment,
    TResult? Function(_RecieveComment value)? recieveComment,
  }) {
    return recieveComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? connect,
    TResult Function(_SendComment value)? sendComment,
    TResult Function(_RecieveComment value)? recieveComment,
    required TResult orElse(),
  }) {
    if (recieveComment != null) {
      return recieveComment(this);
    }
    return orElse();
  }
}

abstract class _RecieveComment implements CommentEvent {
  const factory _RecieveComment(final Comment comment) = _$_RecieveComment;

  Comment get comment;
  @JsonKey(ignore: true)
  _$$_RecieveCommentCopyWith<_$_RecieveComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Comment> comments) success,
    required TResult Function(String message) failure,
    required TResult Function(List<Comment> comments) newComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Comment> comments)? success,
    TResult? Function(String message)? failure,
    TResult? Function(List<Comment> comments)? newComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Comment> comments)? success,
    TResult Function(String message)? failure,
    TResult Function(List<Comment> comments)? newComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_NewComment value) newComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_NewComment value)? newComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_NewComment value)? newComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateCopyWith<$Res> {
  factory $CommentStateCopyWith(
          CommentState value, $Res Function(CommentState) then) =
      _$CommentStateCopyWithImpl<$Res, CommentState>;
}

/// @nodoc
class _$CommentStateCopyWithImpl<$Res, $Val extends CommentState>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CommentState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Comment> comments) success,
    required TResult Function(String message) failure,
    required TResult Function(List<Comment> comments) newComment,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Comment> comments)? success,
    TResult? Function(String message)? failure,
    TResult? Function(List<Comment> comments)? newComment,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Comment> comments)? success,
    TResult Function(String message)? failure,
    TResult Function(List<Comment> comments)? newComment,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_NewComment value) newComment,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_NewComment value)? newComment,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_NewComment value)? newComment,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CommentState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CommentState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Comment> comments) success,
    required TResult Function(String message) failure,
    required TResult Function(List<Comment> comments) newComment,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Comment> comments)? success,
    TResult? Function(String message)? failure,
    TResult? Function(List<Comment> comments)? newComment,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Comment> comments)? success,
    TResult Function(String message)? failure,
    TResult Function(List<Comment> comments)? newComment,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_NewComment value) newComment,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_NewComment value)? newComment,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_NewComment value)? newComment,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CommentState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Comment> comments});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_$_Success(
      null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(final List<Comment> comments) : _comments = comments;

  final List<Comment> _comments;
  @override
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'CommentState.success(comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Comment> comments) success,
    required TResult Function(String message) failure,
    required TResult Function(List<Comment> comments) newComment,
  }) {
    return success(comments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Comment> comments)? success,
    TResult? Function(String message)? failure,
    TResult? Function(List<Comment> comments)? newComment,
  }) {
    return success?.call(comments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Comment> comments)? success,
    TResult Function(String message)? failure,
    TResult Function(List<Comment> comments)? newComment,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(comments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_NewComment value) newComment,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_NewComment value)? newComment,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_NewComment value)? newComment,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CommentState {
  const factory _Success(final List<Comment> comments) = _$_Success;

  List<Comment> get comments;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Failure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CommentState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Comment> comments) success,
    required TResult Function(String message) failure,
    required TResult Function(List<Comment> comments) newComment,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Comment> comments)? success,
    TResult? Function(String message)? failure,
    TResult? Function(List<Comment> comments)? newComment,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Comment> comments)? success,
    TResult Function(String message)? failure,
    TResult Function(List<Comment> comments)? newComment,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_NewComment value) newComment,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_NewComment value)? newComment,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_NewComment value)? newComment,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CommentState {
  const factory _Failure(final String message) = _$_Failure;

  String get message;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NewCommentCopyWith<$Res> {
  factory _$$_NewCommentCopyWith(
          _$_NewComment value, $Res Function(_$_NewComment) then) =
      __$$_NewCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Comment> comments});
}

/// @nodoc
class __$$_NewCommentCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res, _$_NewComment>
    implements _$$_NewCommentCopyWith<$Res> {
  __$$_NewCommentCopyWithImpl(
      _$_NewComment _value, $Res Function(_$_NewComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_$_NewComment(
      null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc

class _$_NewComment implements _NewComment {
  const _$_NewComment(final List<Comment> comments) : _comments = comments;

  final List<Comment> _comments;
  @override
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'CommentState.newComment(comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewComment &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewCommentCopyWith<_$_NewComment> get copyWith =>
      __$$_NewCommentCopyWithImpl<_$_NewComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Comment> comments) success,
    required TResult Function(String message) failure,
    required TResult Function(List<Comment> comments) newComment,
  }) {
    return newComment(comments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Comment> comments)? success,
    TResult? Function(String message)? failure,
    TResult? Function(List<Comment> comments)? newComment,
  }) {
    return newComment?.call(comments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Comment> comments)? success,
    TResult Function(String message)? failure,
    TResult Function(List<Comment> comments)? newComment,
    required TResult orElse(),
  }) {
    if (newComment != null) {
      return newComment(comments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_NewComment value) newComment,
  }) {
    return newComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_NewComment value)? newComment,
  }) {
    return newComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_NewComment value)? newComment,
    required TResult orElse(),
  }) {
    if (newComment != null) {
      return newComment(this);
    }
    return orElse();
  }
}

abstract class _NewComment implements CommentState {
  const factory _NewComment(final List<Comment> comments) = _$_NewComment;

  List<Comment> get comments;
  @JsonKey(ignore: true)
  _$$_NewCommentCopyWith<_$_NewComment> get copyWith =>
      throw _privateConstructorUsedError;
}
