part of 'detail_bloc.dart';

@freezed
class DetailState extends BaseState with _$DetailState {
  const DetailState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.followState= false,
    this.likeState = false,
    this.newsDetail,
    this.saveState = false,
    this.numberComment = 0,
  });

  @override
  final News? newsDetail;
  @override
  final bool followState;
  @override
  final bool likeState;
  @override
  final bool saveState;
  @override
  final int numberComment;
}