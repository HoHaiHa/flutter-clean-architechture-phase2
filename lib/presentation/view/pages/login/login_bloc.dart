import 'package:flutter_clean_architecture/domain/entities/user_info.dart';
import 'package:flutter_clean_architecture/shared/common/result.dart';
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
        switch (event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));

            break;
          case _ChangeUsername(username: final newUsername):
            String? error;
            if (newUsername.isEmpty) {
              error = "Username cannot be empty!";
            } else if (newUsername.contains(' ')) {
              error = "Invalid Username!";
            } else {
              error = null;
            }
            emit(state.copyWith(username: newUsername, usernameError: error));
            break;
          case _ChangePassword(password: final newPassword):
            String? error;
            if (newPassword.isEmpty) {
              error = "Password cannot be empty!";
            } else {
              error = null;
            }

            emit(state.copyWith(password: newPassword, passwordError: error));

            break;
          case _ToggleRemember():
            emit(state.copyWith(isRemember: !state.isRemember));
            break;
          case _ChangeAuth(isAuth: final isAuthen):
            emit(state.copyWith(isAuthen: isAuthen));
            break;
          case _Loading():
            emit(state.copyWith(isLoading: !state.isLoading));
            break;
          case _PressGoogleLogin():
            emit(state.copyWith(isGoogleLoginPress: true));
            break;
          case _Login():
            emit(state.copyWith(isLoading: true));

            Result<UserInfo> authenResult = await _loginUserCase.call(
              params: LoginParam(state.username, state.password),
            );
            if (authenResult.success) {
              emit(state.copyWith(isAuthen: true));
            }
            if (!authenResult.success) {
              emit(state.copyWith(isAuthen: false));
            }
            emit(state.copyWith(isLoading: false));
            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final LoginUseCase _loginUserCase;
}
