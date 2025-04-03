import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeLikeNewsForCurrentUserUseCase extends UseCase<void, ChangeLikeNewsForCurrentUserParam> {
  ChangeLikeNewsForCurrentUserUseCase(this._newsRepository);
  NewsRepository _newsRepository;

  @override
  Future<bool> call({required ChangeLikeNewsForCurrentUserParam params}) async {
    return _newsRepository.changeLikeForCurrentUser(params.newsId);
  }
}

class ChangeLikeNewsForCurrentUserParam {
  ChangeLikeNewsForCurrentUserParam(this.newsId);
  final String newsId;
}