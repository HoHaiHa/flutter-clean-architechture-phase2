part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loadData() = _LoadData;
  const factory LoginEvent.changeUsername(String username) = _ChangeUsername;
  const factory LoginEvent.changePassword(String password) = _ChangePassword;
  const factory LoginEvent.toggleRemember() = _ToggleRemember;
  const factory LoginEvent.pressGoogleLogin() = _PressGoogleLogin;
  const factory LoginEvent.pressFacebookLogin() = _PressFacebookLogin;
  const factory LoginEvent.login() = _Login;
}

