// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      name: json['name'] as String,
      description: json['description'] as String,
      date_debut: json['date_debut'] as String?,
      date_fin: json['date_fin'] as String?,
      state: json['state'] as String? ?? 'incompleted',
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'date_debut': instance.date_debut,
      'date_fin': instance.date_fin,
      'state': instance.state,
      'comments': instance.comments,
    };
