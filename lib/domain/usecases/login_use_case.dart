import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';
import 'use_case.dart';

@injectable
class LoginUseCase extends UseCase<void, LoginParam> {
  LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<bool> call({required LoginParam params}) async {
    return _authRepository.login(username:params.username , password: params.password);
  }
}

class LoginParam {
  LoginParam(
      this.username,
      this.password,
      );

  final String username;
  final String password;
}