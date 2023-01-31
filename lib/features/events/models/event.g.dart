// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      organizers: (json['organizers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      date_debut: json['date_debut'] as String?,
      date_fin: json['date_fin'] as String?,
      state: json['state'] as String? ?? 'inactive',
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'organizers': instance.organizers,
      'tasks': instance.tasks,
      'date_debut': instance.date_debut,
      'date_fin': instance.date_fin,
      'state': instance.state,
      'comments': instance.comments,
    };
