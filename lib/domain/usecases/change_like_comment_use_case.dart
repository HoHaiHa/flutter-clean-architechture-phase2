import 'package:flutter_clean_architecture/domain/repositories/news_comment_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeLikeCommentUseCase extends UseCase<void, ChangeLikeCommentParam> {
  ChangeLikeCommentUseCase(this._newsCommentRepository);

  NewsCommentRepository _newsCommentRepository;

  @override
  Future<bool> call({required ChangeLikeCommentParam params}) async {
    return _newsCommentRepository.changeLikeComment(params.commentId);
  }
}

class ChangeLikeCommentParam {
  ChangeLikeCommentParam(this.commentId);

  final String commentId;
}