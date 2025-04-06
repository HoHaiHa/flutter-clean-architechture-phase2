import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';

abstract class NewsCommentRepository {
  Future<List<NewsComment>> getCommentByNewsId(String newsId);
  Future<bool> sendComment(
    String replyToId,
    String content,
    String commentForNewsId,
    String replyToUsername,
  );
  Future<bool> changeLikeComment(String CommentId);
  Future<int> countAllCommentByNewsId(String newsId);
}
