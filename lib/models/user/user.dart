import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed

class User with _$User {
  const factory User({
    
    required String firstname ,
    required String lastname , 
    required String email , 
    String? phone ,
    String? id , 
    String? password ,
    String? image,


  }) = _User;



   factory User.fromJson(Map<String, dynamic>  json) => _$UserFromJson(json);

  
}