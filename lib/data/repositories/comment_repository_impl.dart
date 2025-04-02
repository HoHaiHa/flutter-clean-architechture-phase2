import 'package:injectable/injectable.dart';
import '../../domain/repositories/comment_repository.dart';

@Injectable(as: CommentRepository)
class CommentRepositoryImpl extends CommentRepository {
  CommentRepositoryImpl();

  @override
  Future<int> getNumberCommentByNewsId() {
    // TODO: implement getNumberCommentByNewsId
    throw UnimplementedError();
  }


}