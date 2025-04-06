
import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getListUsers(String key);
  Future<bool> changeFollowUser(String userName);
  Future<User> getUserById(String id);
}