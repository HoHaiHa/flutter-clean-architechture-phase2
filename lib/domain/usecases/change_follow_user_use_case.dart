import 'package:flutter_clean_architecture/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeFollowUserUseCase extends UseCase<void, ChangeFollowUserParam> {
  ChangeFollowUserUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<bool> call({required ChangeFollowUserParam params}) async {
    return _userRepository.changeFollowUser(params.userName);
  }
}

class ChangeFollowUserParam {
  ChangeFollowUserParam(this.userName);
  final String userName;
}