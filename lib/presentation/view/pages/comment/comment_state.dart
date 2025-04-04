part of 'comment_bloc.dart';

@freezed
class CommentState extends BaseState with _$CommentState {
  const CommentState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.likeCommentState = false,
    this.enableSendComment = false,
    this.relyForCommentId = '',
    this.listComments ,
  });
  final bool likeCommentState;
  final bool enableSendComment;
  final String relyForCommentId;
  final List<NewsComment>? listComments;
}
