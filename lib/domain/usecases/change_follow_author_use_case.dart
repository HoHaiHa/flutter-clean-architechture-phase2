import 'package:flutter_clean_architecture/domain/repositories/author_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeFollowAuthorUseCase extends UseCase<void, ChangeFollowAuthorParam> {
  ChangeFollowAuthorUseCase(this._authorRepository);

  final AuthorRepository _authorRepository;

  @override
  Future<bool> call({required ChangeFollowAuthorParam params}) async {
    return _authorRepository.changeFollowAuthor(params.authorName);
  }
}

class ChangeFollowAuthorParam {
  ChangeFollowAuthorParam(this.authorName);
  final String authorName;
}