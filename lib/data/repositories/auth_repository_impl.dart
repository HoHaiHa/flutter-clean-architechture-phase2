import 'package:injectable/injectable.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../shared/common/failure.dart';
import '../../shared/common/result.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Result<UserInfo>> login({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 1));

    if (username == '1' && password == '1') {
      final userInfo = UserInfo( 123456, 'Hồ Hải Hà');
      return Result.completed(userInfo);
    } else {
      return Result.failure(Failure.validateFailure('Sai tài khoản hoặc mật khẩu!'));
    }
  }
}
