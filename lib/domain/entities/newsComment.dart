import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'newsComment.g.dart';

@JsonSerializable()
class NewsComment {
  NewsComment(this.authorComment, this.replyToId, this.content, this.replies, this.userLikeId, this.commentForNewsId );

  factory NewsComment.fromJson(Map<String, dynamic> json) =>
      _$NewsCommentFromJson(json);
  final Author authorComment;
  final String replyToId;
  final String content;
  final List<NewsComment> replies;
  final List<String> userLikeId;
  final String commentForNewsId;

  Map<String, dynamic> toJson() => _$NewsCommentToJson(this);

  int get totalDescendants {
    int count = replies.length;
    for (final reply in replies) {
      count += reply.totalDescendants;
    }
    return count;
  }
}
