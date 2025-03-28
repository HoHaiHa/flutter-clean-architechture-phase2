import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/login_use_case.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUserCase) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
        try {
          logger.d('height--bloc');
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              emit(state.copyWith(isLoginPress: false));
              emit(state.copyWith(isGoogleLoginPress: false));
              emit(state.copyWith(isRemember: false));
              emit(state.copyWith(hidePassword: true));
              break;
            case _ChangeUsername(username: final newUsername):
              String? error;
              if (newUsername.isEmpty) {
                error = "Username cannot be empty!";
              } else if (newUsername.length < 3 && newUsername.length > 0 ) {
                error = "Username must be at least 3 characters!";
              } else if (newUsername.contains(' ')) {
                error = "Invalid Username!";
              }else {
                error = null;
              }
              emit(state.copyWith(
                username: newUsername,
                usernameError: error,
              ));
              break;
            case _ChangePassword(password: final newPassword):
              String? error;
              if (newPassword.length < 6) {
                error = "Password must be at least 6 characters";
              } else {
                error = null;
              }

              emit(state.copyWith(
                password: newPassword,
                passwordError: error,
              ));

              break;
            case _ToggleRemember():
              emit(state.copyWith(isRemember: !state.isRemember));
              break;
            case _ToggleHidePassword():
              emit(state.copyWith(hidePassword: !state.hidePassword));
              break;
            case _LoginPress():
              emit(state.copyWith(isLoginPress: true));
              break;
            case _GoogleLoginPress():
              emit(state.copyWith(isGoogleLoginPress: true));
              break;
            case _Login():
              logger.d('Login--loc');
              bool authen = await _loginUserCase.call(params: LoginParam(state.username, state.password));
              emit(state.copyWith(isAuthen:  authen));
              break;
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }

  final LoginUseCase _loginUserCase;
}