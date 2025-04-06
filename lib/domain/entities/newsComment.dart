import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'newsComment.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsComment {
  NewsComment(
    this.userComment,
    this.replyToCommentId,
    this.content,
    this.replyToUserName,
    this.replies,
    this.userLikeId,
    this.commentForNewsId,
  );

  factory NewsComment.fromJson(Map<String, dynamic> json) =>
      _$NewsCommentFromJson(json);

  String id = const Uuid().v4();
  final User userComment;
  final String replyToCommentId;
  final String content;
  final String replyToUserName;
  final List<NewsComment> replies;
  final List<String> userLikeId;
  final String commentForNewsId;
  DateTime createAt = DateTime.now();

  Map<String, dynamic> toJson() => _$NewsCommentToJson(this);

  int get totalDescendants {
    int count = replies.length;
    for (final reply in replies) {
      count += reply.totalDescendants;
    }
    return count;
  }

  bool checkUserLike(String userIdCheck){
    return userLikeId.any((userId)=> userId == userIdCheck);
  }
}
