import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/comments/comment.dart';
import '../../../models/user/user.dart';
import '../../tasks/models/task.dart';
part  'event.freezed.dart';
part 'event.g.dart';
@freezed

class Event with _$Event{
  const factory Event({
    required String name,
    required String description,
    required String image ,
    List<User>? organizers ,
    List<Task>? tasks,

    String? date_debut,
    String? date_fin , 
    @Default('inactive') String? state,
    
    List<Comment>? comments,

  }) = _Event; 

       factory Event.fromJson(Map<String, dynamic>  json) => _$EventFromJson(json);

}
