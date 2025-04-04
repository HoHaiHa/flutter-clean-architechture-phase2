import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';

abstract class NewsCommentRepository {
  Future<List<NewsComment>> getCommentByNewsId(String newsId);
}