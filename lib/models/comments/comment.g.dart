// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      content: json['content'] as String,
      userName: json['userName'] as String,
      UserImage: json['UserImage'] as String?,
      Userid: json['Userid'] as String?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'content': instance.content,
      'userName': instance.userName,
      'UserImage': instance.UserImage,
      'Userid': instance.Userid,
    };
