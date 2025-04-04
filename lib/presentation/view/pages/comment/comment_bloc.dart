import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_comment_by_news_id_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/send_news_comment_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'comment_bloc.freezed.dart';
part 'comment_event.dart';
part 'comment_state.dart';

@injectable
class CommentBloc extends BaseBloc<CommentEvent, CommentState> {
  CommentBloc(this._getCommentByNewsIdUseCase, this._sendNewsCommentUseCase) : super(const CommentState()) {
    on<CommentEvent>((event, emit) async {
        try {
          switch(event) {
            case _LoadData(newsId: final newsId):
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              final List<NewsComment> listComments = await _getCommentByNewsIdUseCase.call(params: GetCommentByNewsIdParam(newsId));
              emit(state.copyWith(listComments: listComments));
              break;
            case _ChangeLike():
              break;
            case _SendComment(newsId: final newsId):
              await _sendNewsCommentUseCase.call(params: SendNewsCommentParam(state.relyToCommentId, state.commentInput ?? '', newsId));
              final List<NewsComment> listComments = await _getCommentByNewsIdUseCase.call(params: GetCommentByNewsIdParam(newsId));
              emit(state.copyWith(listComments: listComments,commentInput: '', relyToCommentId: ''));
              break;
            case _ChangeCommentInput(comment: final comment):
              emit(state.copyWith(commentInput: comment));
              if(comment == '') {
                emit(state.copyWith(enableSendComment: false));
              } else {
                emit(state.copyWith(enableSendComment: true));
              }
              break;
            case _SetReplyTo(commentId: final commentId):
              emit(state.copyWith(relyToCommentId: commentId));
              break;
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
  final GetCommentByNewsIdUseCase _getCommentByNewsIdUseCase;
  final SendNewsCommentUseCase _sendNewsCommentUseCase;
}