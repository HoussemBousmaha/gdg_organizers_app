import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/comments/comment.dart';
part  'task.freezed.dart';
part 'task.g.dart';
@freezed

class Task with _$Task{
  const factory Task({
    required String name,
    required String description,
    String? date_debut,
    String? date_fin , 
    @Default('incompleted') String? state,
    List<Comment>? comments,

  }) = _Task; 

       factory Task.fromJson(Map<String, dynamic>  json) => _$TaskFromJson(json);

}



