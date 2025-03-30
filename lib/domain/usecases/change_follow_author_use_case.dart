import 'package:flutter_clean_architecture/domain/repositories/author_repository.dart';
import 'package:flutter_clean_architecture/shared/common/result.dart';
import 'package:injectable/injectable.dart';

import '../entities/author.dart';
import 'use_case.dart';

@injectable
class ChangeFollowAuthorUseCase extends UseCase<void, ChangeFollowAuthorParam> {
  ChangeFollowAuthorUseCase(this._authorRepository);

  final AuthorRepository _authorRepository;

  @override
  Future<Result<List<Author>>> call({required ChangeFollowAuthorParam params}) async {
    return _authorRepository.changeFollowAuthor(params.authorName);
  }
}

class ChangeFollowAuthorParam {
  ChangeFollowAuthorParam(this.authorName);
  final String authorName;
}