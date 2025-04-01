
import '../entities/author.dart';

abstract class AuthorRepository {
  Future<List<Author>> getListAuthors(String key);

  Future<bool> changeFollowAuthor(String authorName);
}