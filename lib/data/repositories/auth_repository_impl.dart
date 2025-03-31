import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserInfo> login({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 1));

    if (username == '1' && password == '1') {
      final userInfo = UserInfo( 123456, 'Hồ Hải Hà');
      return userInfo;
    } else {
      throw BusinessErrorEntityData(name: 'lỗi đăng nhập', message: 'Sai Tên Đăng nhập hoặc mật khẩu');
    }
  }
}
