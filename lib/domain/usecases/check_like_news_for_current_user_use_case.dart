import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class CheckLikeNewsForCurrentUserUseCase
    extends UseCase<void, CheckLikeNewsForCurrentUserParam> {
  CheckLikeNewsForCurrentUserUseCase(this._newsRepository);

  NewsRepository _newsRepository;

  @override
  Future<bool> call({required CheckLikeNewsForCurrentUserParam params}) async {
    return _newsRepository.checkLikeForCurrentUser(params.newsId);
  }
}

class CheckLikeNewsForCurrentUserParam {
  CheckLikeNewsForCurrentUserParam(this.newsId);
  final String newsId;
}
