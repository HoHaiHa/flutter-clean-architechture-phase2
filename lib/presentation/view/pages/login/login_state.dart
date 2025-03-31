part of 'login_bloc.dart';

const LOGIN_USERNAME = 'username';
const LOGIN_PASSWORD = 'password';

@freezed
class LoginState extends BaseState with _$LoginState {

  const LoginState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.username = const ValidationModel(LOGIN_USERNAME),
    this.password = const ValidationModel(LOGIN_PASSWORD),
    this.usernameError,
    this.passwordError,
    this.isRemember = false,
    this.isLoading = false,
    this.isLoginSuccess ,
    this.error ,
  });

  @override
  final ValidationModel<String> username;
  @override
  final ValidationModel<String> password;
  @override
  final String? usernameError;
  @override
  final String? passwordError;
  @override
  final bool isRemember;
  @override
  final bool isLoading;
  @override
  final bool? isLoginSuccess;
  @override
  final String? error;
}
