

abstract interface class AuthRepository {
  Future<bool> login(
      {required String username, required String password});

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
