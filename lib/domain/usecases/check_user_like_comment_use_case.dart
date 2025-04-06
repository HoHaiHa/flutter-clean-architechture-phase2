import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class CheckUserLikeCommentUseCase extends UseCase<void, CheckUserLikeCommentParam> {
  CheckUserLikeCommentUseCase();

  @override
  Future<bool> call({required CheckUserLikeCommentParam params}) async {
    // TODO
    return false;
  }
}

class CheckUserLikeCommentParam {
  CheckUserLikeCommentParam();
}