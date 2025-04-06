import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetAllUserUseCase extends UseCase<void, GetAllUserParam> {
  GetAllUserUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<List<User>> call({required GetAllUserParam params}) async {
    return _userRepository.getListUsers(params.key);
  }
}

class GetAllUserParam {
  GetAllUserParam(
      this.key,
      );
  final String key;
}