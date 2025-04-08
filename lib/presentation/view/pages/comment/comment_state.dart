part of 'comment_bloc.dart';

@freezed
class CommentState extends BaseState with _$CommentState {
  const CommentState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.likeCommentState = false,
    this.enableSendComment = false,
    this.relyToCommentId = '',
    this.listComments ,
    this.commentInput,
    this.replyToUsername,
    this.currentUserid = '',
    this.currentNewsId = '',
  });
  @override
  final bool likeCommentState;
  @override
  final bool enableSendComment;
  @override
  final String relyToCommentId;
  @override
  final List<NewsComment>? listComments;
  @override
  final String? commentInput;
  @override
  final String? replyToUsername;
  @override
  final String currentUserid;
  @override
  final String currentNewsId;
}
