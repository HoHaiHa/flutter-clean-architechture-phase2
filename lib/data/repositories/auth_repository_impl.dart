import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<bool> login({required String username, required String password}) async {
    if (username == 'hohaiha' && password == '12345678') {
      await Future.delayed(Duration(seconds: 1));
      return true;
    } else{
      await Future.delayed(Duration(seconds: 1));
      return false;
    }

  }
}
