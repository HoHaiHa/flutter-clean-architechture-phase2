import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';
import 'package:flutter_clean_architecture/domain/repositories/news_comment_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetCommentByNewsIdUseCase extends UseCase<void, GetCommentByNewsIdParam> {
  GetCommentByNewsIdUseCase(this._newsCommentRepository);
  NewsCommentRepository _newsCommentRepository;

  @override
  Future<List<NewsComment>> call({required GetCommentByNewsIdParam params}) async {
    return _newsCommentRepository.getCommentByNewsId(params.newsId);
  }
}

class GetCommentByNewsIdParam {
  GetCommentByNewsIdParam(this.newsId);
  final String newsId;
}