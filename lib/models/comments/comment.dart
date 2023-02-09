import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../user/user.dart';


part  'comment.freezed.dart';
part 'comment.g.dart';



@freezed

class Comment with _$Comment{
  const factory Comment({
    required String content,
    User ? sender,
    String? createdAt,
    bool? isEvent,


  }) = _Comment; 
     factory Comment.fromJson(Map<String, dynamic>  json) => _$CommentFromJson(json);

}
