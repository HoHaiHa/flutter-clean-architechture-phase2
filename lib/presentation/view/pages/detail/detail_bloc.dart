import 'package:flutter_clean_architecture/domain/usecases/change_follow_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_like_news_for_current_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/check_like_news_for_current_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/count_all_comment_by_news_id_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_news_by_id_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/news.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'detail_bloc.freezed.dart';
part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends BaseBloc<DetailEvent, DetailState> {
  DetailBloc(
    this._changeLikeNewsForCurrentUserUseCase,
    this._getNewsByIdUseCase,
    this._checkLikeNewsForCurrentUserUseCase,
    this._changeFollowUserUseCase,
    this._countAllCommentByNewsIdUseCase,
  ) : super(const DetailState()) {
    on<DetailEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData(newsId: final newsId):
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            News news = await _getNewsByIdUseCase.call(
              params: GetNewsByIdParam(newsId),
            );
            bool userLike = await _checkLikeNewsForCurrentUserUseCase.call(
              params: CheckLikeNewsForCurrentUserParam(newsId),
            );
            emit(state.copyWith(newsDetail: news, likeState: userLike));
            int countNumberComment = await _countAllCommentByNewsIdUseCase.call(
              params: CountAllCommentByNewsIdParam(state.newsDetail?.id ?? ''),
            );
            emit(state.copyWith(numberComment: countNumberComment));
            break;
          case _ChangeFollow(userName: final userName):
            await _changeFollowUserUseCase.call(
              params: ChangeFollowUserParam(userName),
            );
            emit(state.copyWith(followState: !state.followState));
          case _ChangeSave():
            emit(state.copyWith(saveState: !state.saveState));
            break;
          case _ChangeLike():
            await _changeLikeNewsForCurrentUserUseCase.call(
              params: ChangeLikeNewsForCurrentUserParam(
                state.newsDetail?.id ?? '',
              ),
            );
            bool userLike = await _checkLikeNewsForCurrentUserUseCase.call(
              params: CheckLikeNewsForCurrentUserParam(
                state.newsDetail?.id ?? '',
              ),
            );
            emit(state.copyWith(likeState: userLike));
            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
  GetNewsByIdUseCase _getNewsByIdUseCase;
  CheckLikeNewsForCurrentUserUseCase _checkLikeNewsForCurrentUserUseCase;
  ChangeFollowUserUseCase _changeFollowUserUseCase;
  ChangeLikeNewsForCurrentUserUseCase _changeLikeNewsForCurrentUserUseCase;
  CountAllCommentByNewsIdUseCase _countAllCommentByNewsIdUseCase;
}
