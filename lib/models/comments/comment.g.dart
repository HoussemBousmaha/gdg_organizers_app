// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      content: json['content'] as String,
      sender: json['sender'] == null
          ? null
          : User.fromJson(json['sender'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      isEvent: json['isEvent'] as bool?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'content': instance.content,
      'sender': instance.sender,
      'createdAt': instance.createdAt,
      'isEvent': instance.isEvent,
    };
