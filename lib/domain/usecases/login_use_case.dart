import 'package:flutter_clean_architecture/shared/common/validation_model.dart';
import 'package:injectable/injectable.dart';
import '../../shared/common/error_entity/error_entity.dart';
import '../entities/user_info.dart';
import '../repositories/auth_repository.dart';
import 'use_case.dart';

@injectable
class LoginUseCase extends UseCase<UserInfo, LoginParam> {
  LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<UserInfo> call({required LoginParam params}) async {
    ErrorEntity? error;

    error ??= params.username.checkInputIsRequired();
    error ??= params.password.checkInputIsRequired();

    if(error != null) {
      throw error;
    }

    return _authRepository.login(
      password: params.password.value ?? '' , username: params.username.value ?? '',
    );
  }
}

class LoginParam {
  LoginParam(this.username, this.password);

  final ValidationModel<String> username;
  final ValidationModel<String> password;
}
