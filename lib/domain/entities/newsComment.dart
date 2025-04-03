import 'package:freezed_annotation/freezed_annotation.dart';

part 'newsComment.g.dart';

@JsonSerializable()
class NewsComment {
  NewsComment( this.userCommentId, this.content, this.newsId,
      this.replies, this.userLike, this.commentForNewsId,);
  final String userCommentId;
  final String content;
  final String newsId;
  final List<NewsComment> replies;
  final List<NewsComment> userLike;
  final String commentForNewsId;
}
