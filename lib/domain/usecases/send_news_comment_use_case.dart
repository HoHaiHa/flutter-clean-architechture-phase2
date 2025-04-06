import 'package:flutter_clean_architecture/domain/repositories/news_comment_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class SendNewsCommentUseCase extends UseCase<void, SendNewsCommentParam> {
  SendNewsCommentUseCase(this._newsCommentRepository);
  NewsCommentRepository _newsCommentRepository;

  @override
  Future<bool> call({required SendNewsCommentParam params}) async {
    return _newsCommentRepository.sendComment(params.replyToId,params.content,params.commentForNewsId,params.replyToUsername);
  }
}

class SendNewsCommentParam {
  SendNewsCommentParam(this.replyToId, this.content, this.commentForNewsId, this.replyToUsername);
  final String replyToId;
  final String content;
  final String commentForNewsId;
  final String replyToUsername;
}