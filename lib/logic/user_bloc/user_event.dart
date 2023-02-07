part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateUser(Map<String,dynamic> data) = _UpdateUser;
  const factory UserEvent.updateUserImage(String path) = _UpdateUserImage;
  const factory UserEvent.updateUserPassword(String password) = _UpdateUserPassword;
  
}