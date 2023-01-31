// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as int? ?? 0000,
      id: json['id'] as String?,
      token: json['token'] as String?,
      password: json['password'] as String?,
      fcmtoken: json['fcmtoken'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'id': instance.id,
      'token': instance.token,
      'password': instance.password,
      'fcmtoken': instance.fcmtoken,
      'image': instance.image,
    };
