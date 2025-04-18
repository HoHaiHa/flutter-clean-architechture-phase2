import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/news.dart';
import 'use_case.dart';

@injectable
class SearchNewsUseCase extends UseCase<void, SearchNewsParam> {
  SearchNewsUseCase(this._newsRepository);

  final NewsRepository _newsRepository;

  @override
  Future<List<News>> call({required SearchNewsParam params}) async {
    return _newsRepository.searchNewByTopic(key: params.key);
  }
}

class SearchNewsParam {
  SearchNewsParam(this.key);
  final String key;
}