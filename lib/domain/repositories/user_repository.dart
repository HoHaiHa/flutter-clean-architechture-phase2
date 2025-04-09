

import '../../data/remote/models/Request/edit_profile_request.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getListUsers(String key);
  Future<bool> changeFollowUser(String userName);
  Future<User> getUserById(String id);
  Future<bool> editProfile(EditProfileRequest request);
}