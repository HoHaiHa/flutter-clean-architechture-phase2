import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/news.dart';
import 'use_case.dart';

@injectable
class GetNewsOfCurrentUserUseCase extends UseCase<void, GetNewsOfCurrentUserParam> {
  GetNewsOfCurrentUserUseCase(this._newsRepository);
  NewsRepository _newsRepository;

  @override
  Future<List<News>> call({required GetNewsOfCurrentUserParam params}) async {
    return _newsRepository.getNewsOfCurrentUser();
  }
}

class GetNewsOfCurrentUserParam {
  GetNewsOfCurrentUserParam();
}