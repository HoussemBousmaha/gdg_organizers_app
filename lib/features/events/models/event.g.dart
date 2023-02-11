// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      organizers: (json['organizers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      datedebut: json['datedebut'] as String?,
      datefin: json['datefin'] as String?,
      state: json['state'] as String? ?? 'inactive',
      thread: json['thread'] as String?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'organizers': instance.organizers,
      'tasks': instance.tasks,
      'datedebut': instance.datedebut,
      'datefin': instance.datefin,
      'state': instance.state,
      'thread': instance.thread,
    };
