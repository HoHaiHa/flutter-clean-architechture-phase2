import 'package:flutter_clean_architecture/data/remote/models/response/login_info_response.dart';

import '../entities/current_user.dart';

abstract interface class AuthRepository {
  Future<CurrentUser> login(
      {required String username, required String password,required bool isRemember});

  Future<CurrentUser> getCurrentUser();

  Future<bool> loginByGoogle();

  Future<LoginInfoResponse> checkRememberPassword();

  // Future<Result<String?>> getUsername();
  //
  // Future<Result<void>> saveUsername(String username);
  //
  // Future<Result<UserInfo>> getUserInfo();
  //
  // Future<Result<bool>> isLogined();
  //
  // Future<Result<void>> removeAccessToken();
}
