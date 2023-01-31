import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part  'comment.freezed.dart';
part 'comment.g.dart';



@freezed

class Comment with _$Comment{
  const factory Comment({
    required String content,
    required String userName,
    String? UserImage,
    String? Userid , 

  }) = _Comment; 
     factory Comment.fromJson(Map<String, dynamic>  json) => _$CommentFromJson(json);

}
