import '../entities/user_info.dart';

abstract interface class AuthRepository {
  Future<UserInfo> login(
      {required String username, required String password});

  Future<String> getUserId();

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
