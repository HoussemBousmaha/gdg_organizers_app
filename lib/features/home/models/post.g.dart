// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      body: json['body'] as String,
      title: json['title'] as String?,
      postedBy: json['postedBy'] == null
          ? null
          : User.fromJson(json['postedBy'] as Map<String, dynamic>),
      photo: json['photo'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'body': instance.body,
      'title': instance.title,
      'postedBy': instance.postedBy,
      'photo': instance.photo,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'password': instance.password,
    };
