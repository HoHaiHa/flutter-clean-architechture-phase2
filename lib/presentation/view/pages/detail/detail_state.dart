part of 'detail_bloc.dart';

@freezed
class DetailState extends BaseState with _$DetailState {
  const DetailState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.followState,
    this.likeState,
    this.NewsDetail,
    this.saveState,
  });

  final News NewsDetail;
  final bool followState;
  final bool likeState;
  final bool saveState;
}