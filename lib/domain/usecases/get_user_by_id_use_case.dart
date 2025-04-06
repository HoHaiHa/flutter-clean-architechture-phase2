import 'package:flutter_clean_architecture/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/domain/usecases/use_case.dart';
import 'package:injectable/injectable.dart';
import '../entities/user.dart';

@injectable
class GetUserByIdUseCase extends UseCase<void, GetUserByIdParam> {
  GetUserByIdUseCase(this._userRepository);
  UserRepository _userRepository;

  @override
  Future<User> call({required GetUserByIdParam params}) async {
    return _userRepository.getUserById(params.id);
  }
}

class GetUserByIdParam {
  GetUserByIdParam(this.id);

  final String id;
}