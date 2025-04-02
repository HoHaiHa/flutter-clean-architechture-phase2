import 'package:flutter_clean_architecture/domain/repositories/comment_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetNumberCommentByNewsIdUseCase extends UseCase<void, GetNumberCommentByNewsIdParam> {
  GetNumberCommentByNewsIdUseCase(this._commentRepository);

  final CommentRepository _commentRepository;

  @override
  Future<bool> call({required GetNumberCommentByNewsIdParam params}) async {
    // TODO
    return false;
  }
}

class GetNumberCommentByNewsIdParam {
  GetNumberCommentByNewsIdParam();
}