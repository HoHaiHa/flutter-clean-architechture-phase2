part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loadData() = _LoadData;
  const factory LoginEvent.changeUsername(String username) = _ChangeUsername;
  const factory LoginEvent.changePassword(String password) = _ChangePassword;
  const factory LoginEvent.toggleRemember() = _ToggleRemember;
  const factory LoginEvent.toggleHidePassword() = _ToggleHidePassword;
  const factory LoginEvent.pressLogin() = _LoginPress;
  const factory LoginEvent.googleLoginPress() = _GoogleLoginPress;
  const factory LoginEvent.login() = _Login;
}

