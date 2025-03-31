import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/domain/repositories/author_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetAllAuthorUseCase extends UseCase<void, GetAllAuthorParam> {
  GetAllAuthorUseCase(this._authorRepository);

  final AuthorRepository _authorRepository;

  @override
  Future<List<Author>> call({required GetAllAuthorParam params}) async {
    return _authorRepository.getListAuthors(params.key);
  }
}

class GetAllAuthorParam {
  GetAllAuthorParam(
      this.key,
      );
  final String key;
}