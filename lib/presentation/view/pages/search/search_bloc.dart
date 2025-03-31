import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_save_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_all_author_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_all_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/search_news_use_case.dart';
import 'package:flutter_clean_architecture/shared/common/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/news.dart';
import '../../../../domain/usecases/change_follow_author_use_case.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../../shared/utils/logger.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  SearchBloc(
    this._searchNewsUseCase,
    this._getAllTopicUseCase,
    this._getAllAuthorUseCase,
    this._changeSaveTopicUseCase,
    this._changeFollowAuthorUseCase,
  ) : super(const SearchState()) {
    on<SearchEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            final List<News> listNewsResult = await _searchNewsUseCase.call(
              params: SearchNewsParam(''),
            );
            emit(state.copyWith(listNews: listNewsResult));
            final List<Topic> listTopicsResult =await _getAllTopicUseCase.call(params: GetAllTopicParam(''));
            emit(state.copyWith(listTopics: listTopicsResult));
            final List<Author> listAuthorsResult = await _getAllAuthorUseCase
                .call(params: GetAllAuthorParam(''));
            emit(state.copyWith(listAuthors: listAuthorsResult));
            break;
          case _ChangeSearchKey(key: final key):
            emit(state.copyWith(searchKey: key));

            final List<News> listNewsResult = await _searchNewsUseCase.call(
              params: SearchNewsParam(state.searchKey ?? ''),
            );

            emit(state.copyWith(listNews: listNewsResult));

            final List<Topic> listTopicResult = await _getAllTopicUseCase.call(
              params: GetAllTopicParam(state.searchKey ?? ''),
            );
            emit(state.copyWith(listTopics: listTopicResult));

            final List<Author> listAuthorsResult = await _getAllAuthorUseCase
                .call(params: GetAllAuthorParam(state.searchKey ?? ''));

            break;
          case _ChangeTab():
            // TODO: Handle this case.
            throw UnimplementedError();
          case _ChangeSaveTopic(topicName: final topicName):
            emit(state.copyWith(saveTopic: !state.saveTopic));
            final Result<void> changeSaveTopicResult =
                await _changeSaveTopicUseCase.call(
                  params: ChangeSaveTopicParam(topicName),
                );
            if (changeSaveTopicResult.success) {
              final List<Topic> listTopicResult = await _getAllTopicUseCase
                  .call(params: GetAllTopicParam(state.searchKey ?? ''));
            }
            break;
          case _ChangeFollowAuthor(authorName: final authorName):
            emit(state.copyWith(followAuthor: !state.followAuthor));
            final Result<List<Author>> changeFollowResult =
                await _changeFollowAuthorUseCase.call(
                  params: ChangeFollowAuthorParam(authorName),
                );
            if (changeFollowResult.success) {
              final List<Author> listAuthorsResult = await _getAllAuthorUseCase
                  .call(params: GetAllAuthorParam(state.searchKey ?? ''));
            } else {
              logger.d(
                'có lỗi khi thay đổi save topic ${changeFollowResult.failure}',
              );
            }
            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final SearchNewsUseCase _searchNewsUseCase;
  final GetAllTopicUseCase _getAllTopicUseCase;
  final GetAllAuthorUseCase _getAllAuthorUseCase;
  final ChangeSaveTopicUseCase _changeSaveTopicUseCase;
  final ChangeFollowAuthorUseCase _changeFollowAuthorUseCase;
}
