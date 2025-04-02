import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetNewsByIdUseCase extends UseCase<void, GetNewsByIdParam> {
  GetNewsByIdUseCase(this._newsRepository);

  NewsRepository _newsRepository;

  @override
  Future<News> call({required GetNewsByIdParam params}) async {
    return _newsRepository.getNewsById(params.newsId);
  }
}

class GetNewsByIdParam {
  GetNewsByIdParam(this.newsId);
  final String newsId;
}