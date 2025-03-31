import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/common/validation_model.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecases/login_use_case.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../../shared/common/error_entity/error_entity.dart';
import '../../../../shared/common/error_entity/validation_error_entity.dart';
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
            emit(
              state.copyWith(username: state.username.copyWith(newUsername)),
            );
            break;
          case _ChangePassword(password: final newPassword):
            emit(
              state.copyWith(password: state.password.copyWith(newPassword)),
            );
            break;
          case _ToggleRemember():
            emit(state.copyWith(isRemember: !state.isRemember));
            break;
          case _PressGoogleLogin():
            break;
          case _Login():
            emit(state.copyWith(isLoading: true, error: null));
            final _loginResult = await _loginUserCase.call(
              params: LoginParam(state.username, state.password),
            );
            emit(state.copyWith(isLoginSuccess: true, isLoading: false));
            break;
          case _PressFacebookLogin():
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      } catch (e, s) {
        emit(state.copyWith(isLoading: false));
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final LoginUseCase _loginUserCase;

  @override
  void handleError<S>(Emitter<S> emit, Object error) {
    if (error is ValidationErrorEntity) {
      if (error.key == LOGIN_USERNAME) {
        emit(
          state.copyWith(username: state.username.copyWithError(error.message))
              as S,
        );
      }
      if (error.key == LOGIN_PASSWORD) {
        emit(
          state.copyWith(password: state.password.copyWithError(error.message))
              as S,
        );
      }
    } else {
      final message = error is ErrorEntity ? error.message : 'Error something..';

      logger.d("duc.trandinh Has error $message");
      emit(state.copyWith(error: message) as S);

    }
  }
}
