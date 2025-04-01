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

  @override
  final News? NewsDetail;
  @override
  final bool? followState;
  @override
  final bool? likeState;
  @override
  final bool? saveState;
}