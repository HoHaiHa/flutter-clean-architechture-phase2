import 'package:freezed_annotation/freezed_annotation.dart';

part 'newsComment.g.dart';

@JsonSerializable()
class NewsComment {

  NewsComment(this.commentId, this.userCommentId, this.content, this.NewsId,
      this.relyForCommentId, this.userLike, this.commentForNewsId,);
  final String commentId;
  final String userCommentId;
  final String content;
  final String NewsId;
  final String relyForCommentId;
  final List<String> userLike;
  final String commentForNewsId;
}
