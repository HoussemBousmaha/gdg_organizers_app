// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      name: json['name'] as String,
      description: json['description'] as String,
      datedebut: json['datedebut'] as String?,
      datefin: json['datefin'] as String?,
      duration: json['duration'] as String?,
      state: json['state'] as String? ?? 'incompleted',
      thread: json['thread'] as String?,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'datedebut': instance.datedebut,
      'datefin': instance.datefin,
      'duration': instance.duration,
      'state': instance.state,
      'thread': instance.thread,
    };
