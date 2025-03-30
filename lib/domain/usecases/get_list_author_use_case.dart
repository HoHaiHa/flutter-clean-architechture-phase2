import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/domain/repositories/author_repository.dart';
import 'package:flutter_clean_architecture/shared/common/result.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetListAuthorUseCase extends UseCase<void, GetListAuthorParam> {
  GetListAuthorUseCase(this._authorRepository);

  final AuthorRepository _authorRepository;

  @override
  Future<Result<List<Author>>> call({required GetListAuthorParam params}) async {
    return _authorRepository.getListAuthors(params.key);
  }
}

class GetListAuthorParam {
  GetListAuthorParam(
      this.key,
      );
  final String key;
}