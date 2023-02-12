part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appstarted() = _AppStarted;
  const factory AuthEvent.loggedIn(Map<String, dynamic> data, String token) = _LoggedIn;
  const factory AuthEvent.loggedOut() = _LoggedOut;
  const factory AuthEvent.updateuser(Map<String, dynamic> data) = _UpdateUser;
}
