import 'package:flutter_clean_architecture/domain/usecases/change_follow_author_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_like_news_for_current_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/check_like_news_for_current_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_news_by_id_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/news.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../../shared/utils/logger.dart';
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
    this._changeFollowAuthorUseCase,
  ) : super(const DetailState()) {
    on<DetailEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData(newsId: final newsId):
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            News news = await _getNewsByIdUseCase.call(
              params: GetNewsByIdParam(newsId),
            );
            emit(state.copyWith(newsDetail: news));
            bool userLike = await _checkLikeNewsForCurrentUserUseCase.call(
              params: CheckLikeNewsForCurrentUserParam(newsId),
            );
            emit(state.copyWith(likeState: userLike));
            logger.d(news);
            break;
          case _ChangeFollow(authorName: final authorName):
            bool isFollow = await _changeFollowAuthorUseCase.call(
              params: ChangeFollowAuthorParam(authorName),
            );
            emit(state.copyWith(followState: !state.followState));
          case _ChangeSave():
            emit(state.copyWith(saveState: !state.saveState));
            break;
          case _ChangeLike():
            await _changeLikeNewsForCurrentUserUseCase.call(params: ChangeLikeNewsForCurrentUserParam(state.newsDetail?.id ?? ''));
            bool userLike = await _checkLikeNewsForCurrentUserUseCase.call(
              params: CheckLikeNewsForCurrentUserParam(state.newsDetail?.id ?? ''),
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
  ChangeFollowAuthorUseCase _changeFollowAuthorUseCase;
  ChangeLikeNewsForCurrentUserUseCase _changeLikeNewsForCurrentUserUseCase;
}
