import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed

class User with _$User {
  const factory User({
    
    required String firstname ,
    required String lastname , 
    required String email , 
    @Default(0000) int? phone ,
    String? id , 
    String? token ,
    String? password ,
    String? fcmtoken,
    String? image,


  }) = _User;



   factory User.fromJson(Map<String, dynamic>  json) => _$UserFromJson(json);

  
}