part of 'login_bloc.dart';

@freezed
class LoginState extends BaseState with _$LoginState {

  const LoginState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.username = '',
    this.password = '',
    this.usernameError,
    this.passwordError,
    this.isRemember = false,
    this.hidePassword= true,
    this.isLoginPress = false,
    this.isGoogleLoginPress= false,
    this.isAuthen ,
  });

  @override
  final String username;
  @override
  final String password;
  @override
  final String? usernameError;
  @override
  final String? passwordError;
  @override
  final bool isRemember;
  @override
  final bool hidePassword;
  @override
  final bool isLoginPress;
  @override
  final bool isGoogleLoginPress;
  @override
  final bool? isAuthen;
}
