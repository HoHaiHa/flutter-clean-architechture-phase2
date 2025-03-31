import 'package:flutter_clean_architecture/shared/common/result.dart';

import '../entities/author.dart';

abstract class AuthorRepository {
  Future<List<Author>> getListAuthors(String key);

  Future<Result<List<Author>>> changeFollowAuthor(String authorName);
}