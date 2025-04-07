import 'package:flutter_clean_architecture/data/remote/models/response/login_info_response.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class CheckRememberPasswordUseCase extends UseCase<void, CheckRememberPasswordParam> {
  CheckRememberPasswordUseCase(this._authRepository);
  AuthRepository _authRepository;
  @override
  Future<LoginInfoResponse> call({required CheckRememberPasswordParam params}) async {
    return _authRepository.checkRememberPassword();
  }
}

class CheckRememberPasswordParam {
  CheckRememberPasswordParam();
}