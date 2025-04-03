import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../shared/utils/logger.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {


  @override
  Future<UserInfo> login({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 1));

    if (username == '1' && password == '1') {
      final UserInfo userInfo = UserInfo('1', 'Hồ Hải Hà', 'https://cdn-media.sforum.vn/storage/app/media/anh-dep-116.jpg', 'hohaiha', 'ha01@gmail.com', '1234', 'bio', 'website');
      await saveUserToShareRefrence(userInfo);
      return userInfo;
    } else {
      throw BusinessErrorEntityData(name: 'lỗi đăng nhập', message: 'Sai Tên Đăng nhập hoặc mật khẩu');
    }
  }

  @override
  Future<UserInfo> saveUserToShareRefrence(UserInfo userInfo) async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentUserId', userInfo.id);
      await prefs.setString('currentImagePath', userInfo.imagePath ?? '');
      await prefs.setString('currentFullName', userInfo.fullName?? '');
      await prefs.setString('currentUsername', userInfo.username);
      await prefs.setString('currentEmail', userInfo.email);
      await prefs.setString('currentPhoneNumber', userInfo.phoneNumber);
      await prefs.setString('currentBio', userInfo.bio?? '');
      await prefs.setString('currentWebsite', userInfo.website?? '');
      logger.d('lưu thành công user ${prefs.getString('currentUsername')}');
      return userInfo;
    }catch(e){
      logger.d('lưu userinfo vào prefrence không thành công');
      throw BusinessErrorEntityData(name: 'lưu userinfo vào prefrence không thành công', message: 'lưu userinfo vào prefrence không thành công');
    }
  }
}
