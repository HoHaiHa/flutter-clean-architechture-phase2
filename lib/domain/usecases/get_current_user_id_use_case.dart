import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetCurrentUserIdUseCase extends UseCase<void, GetCurrentUserIdParam> {
  GetCurrentUserIdUseCase(this._authRepository);
  AuthRepository _authRepository;
  @override
  Future<String> call({required GetCurrentUserIdParam params}) async {
    return _authRepository.getUserId();
  }
}

class GetCurrentUserIdParam {
  GetCurrentUserIdParam();
}