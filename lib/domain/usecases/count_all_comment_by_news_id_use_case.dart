import 'package:flutter_clean_architecture/domain/repositories/news_comment_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class CountAllCommentByNewsIdUseCase extends UseCase<void, CountAllCommentByNewsIdParam> {
  CountAllCommentByNewsIdUseCase(this._newsCommentRepository);
  NewsCommentRepository _newsCommentRepository;

  @override
  Future<int> call({required CountAllCommentByNewsIdParam params}) async {
    return _newsCommentRepository.countAllCommentByNewsId(params.NewsId);
  }
}

class CountAllCommentByNewsIdParam {
  CountAllCommentByNewsIdParam(this.NewsId);
  String NewsId;
}