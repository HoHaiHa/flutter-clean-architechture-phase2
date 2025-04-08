import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/data/remote/models/response/login_info_response.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/current_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../shared/utils/logger.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<CurrentUser> login({
    required String username,
    required String password,
    required bool isRemember,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    if (username == 'hohaiha' && password == 'hohaiha') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final CurrentUser currentUser = CurrentUser(
        '1',
        'Hồ Hải Hà',
        'https://cdn-media.sforum.vn/storage/app/media/anh-dep-116.jpg',
        'hohaiha',
        'ha01@gmail.com',
        '1234',
        'bio',
        'website',
      );
      await saveUserToShareRefrence(currentUser);
      if(isRemember) {
        await prefs.setString('username', username);
        await prefs.setString('password', password);
      }
      else {
        await prefs.setString('username', '');
        await prefs.setString('password', '');
      }
      return currentUser;
    } else {
      throw BusinessErrorEntityData(
        name: 'lỗi đăng nhập',
        message: 'Sai Tên Đăng nhập hoặc mật khẩu',
      );
    }
  }

  Future<CurrentUser> saveUserToShareRefrence(CurrentUser currentUser) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentUserId', '1');
      await prefs.setString('currentImagePath', 'https://cdn-media.sforum.vn/storage/app/media/anh-dep-116.jpg');
      await prefs.setString('currentFullName', currentUser.fullName ?? '');
      await prefs.setString('currentUsername', currentUser.username);
      await prefs.setString('currentEmail', currentUser.email);
      await prefs.setString('currentPhoneNumber', currentUser.phoneNumber);
      await prefs.setString('currentBio', currentUser.bio ?? '');
      await prefs.setString('currentWebsite', currentUser.website ?? '');

      return currentUser;
    } catch (e) {
      logger.d('lưu userinfo không thành công: $e');
      throw BusinessErrorEntityData(
        name: 'lỗi',
        message: 'lưu userinfo vào preference không thành công',
      );
    }
  }

  @override
  Future<CurrentUser> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id =  prefs.getString('currentUserId');
    String? imagePath =  'https://cdn-media.sforum.vn/storage/app/media/anh-dep-116.jpg';//prefs.getString('currentImagePath');
    String? fullName =  prefs.getString('currentFullName');
    String? username =  prefs.getString('currentUsername');
    String? email =  prefs.getString('currentEmail');
    String? phoneNumber =  prefs.getString('currentPhoneNumber' );
    String? bio =  prefs.getString('currentBio');
    String? website =  prefs.getString('currentWebsite');
    CurrentUser currentUser = CurrentUser(id??'', fullName, imagePath, username??'', email??'', phoneNumber??'', bio, website);
    return currentUser;
  }

  @override
  Future<bool> loginByGoogle() async {
    try {
      logger.d(1);
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      //logger.d(googleUser);

      if (googleUser == null) {
        return false;
      }
      logger.d(1);

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;
      logger.d(1);

      if (googleAuth == null) {
        return false;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final CurrentUser currentUser = CurrentUser(
        userCredential.user?.uid ?? '',
        userCredential.user?.displayName,
        userCredential.user?.photoURL,
        userCredential.user?.displayName ?? '',
        userCredential.user?.email ?? '',
        userCredential.user?.phoneNumber ?? '',
        '',
        '',
      );

      await saveUserToShareRefrence(currentUser);

      return true;
    } catch (e) {
      print("Login failed: $e");
      return false;
    }
  }

  @override
  Future<LoginInfoResponse> checkRememberPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? password = prefs.getString('password');
    if((password??'').isEmpty) {
      return LoginInfoResponse(username: '', password: '');
    }
    else{
      String? username = prefs.getString('username');
      String? password = prefs.getString('password');
      return LoginInfoResponse(username: username ??'', password:password??'');
    }

  }
}
