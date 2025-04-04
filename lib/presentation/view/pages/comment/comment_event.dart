part of 'comment_bloc.dart';

@freezed
sealed class CommentEvent with _$CommentEvent {
  const factory CommentEvent.loadData(String newsId) = _LoadData;
  const factory CommentEvent.changeLike(String commentId) = _ChangeLike;
  const factory CommentEvent.sendComment(String commentId) = _SendComment;
}