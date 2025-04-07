import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class LoginByGoogleUseCase extends UseCase<void, LoginByGoogleParam> {
  LoginByGoogleUseCase(this._authRepository);
  AuthRepository _authRepository;

  @override
  Future<bool> call({required LoginByGoogleParam params}) async {
    return _authRepository.loginByGoogle();
  }
}

class LoginByGoogleParam {
  LoginByGoogleParam();
}