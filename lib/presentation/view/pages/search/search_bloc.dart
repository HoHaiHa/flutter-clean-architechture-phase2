import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_save_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_list_author_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_list_topic_use_case.dart';
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
    this._getListTopicUseCase,
    this._getListAuthorUseCase,
    this._changeSaveTopicUseCase,
    this._changeFollowAuthorUseCase,
  ) : super(const SearchState()) {
    on<SearchEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            final Result<List<News>> listNewsResult = await _searchNewsUseCase
                .call(params: SearchNewsParam(''));
            if (listNewsResult.success) {
              emit(state.copyWith(listNews: listNewsResult.data));
            } else {
              logger.d('có lỗi khi lấy listnews ${listNewsResult.failure}');
            }

            final Result<List<Topic>> listTopicResult =
                await _getListTopicUseCase.call(params: GetListTopicParam(''));
            if (listTopicResult.success) {
              emit(state.copyWith(listTopics: listTopicResult.data));
            } else {
              logger.d('có lỗi khi lấy listTopics ${listTopicResult.failure}');
            }

            final Result<List<Author>> listAuthorsResult =
                await _getListAuthorUseCase.call(
                  params: GetListAuthorParam(''),
                );
            if (listAuthorsResult.success) {
              emit(state.copyWith(listAuthors: listAuthorsResult.data));
            } else {
              logger.d(
                'có lỗi khi lấy listAuthors ${listAuthorsResult.failure}',
              );
            }
            break;
          case _ChangeSearchKey(key: final key):
            emit(state.copyWith(searchKey: key));

            final Result<List<News>> listNewsResult = await _searchNewsUseCase
                .call(params: SearchNewsParam(state.searchKey ?? ''));
            if (listNewsResult.success) {
              emit(state.copyWith(listNews: listNewsResult.data));
            } else {
              logger.d('có lỗi khi lấy listnews ${listNewsResult.failure}');
            }

            final Result<List<Topic>> listTopicResult =
                await _getListTopicUseCase.call(
                  params: GetListTopicParam(state.searchKey ?? ''),
                );
            if (listTopicResult.success) {
              emit(state.copyWith(listTopics: listTopicResult.data));
            } else {
              logger.d('có lỗi khi lấy listTopics ${listTopicResult.failure}');
            }

            final Result<List<Author>> listAuthorsResult =
                await _getListAuthorUseCase.call(
                  params: GetListAuthorParam(state.searchKey ?? ''),
                );
            if (listAuthorsResult.success) {
              emit(state.copyWith(listAuthors: listAuthorsResult.data));
            } else {
              logger.d(
                'có lỗi khi lấy listAuthors ${listAuthorsResult.failure}',
              );
            }

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
              final Result<List<Topic>> listTopicResult =
                  await _getListTopicUseCase.call(
                    params: GetListTopicParam(state.searchKey ?? ''),
                  );
              if (listTopicResult.success) {
                emit(state.copyWith(listTopics: listTopicResult.data));
              } else {
                logger.d(
                  'có lỗi khi lấy listTopics ${listTopicResult.failure}',
                );
              }
            } else {
              logger.d(
                'có lỗi khi thay đổi save topic ${changeSaveTopicResult.failure}',
              );
            }
            break;
          case _ChangeFollowAuthor(authorName: final authorName):
            emit(state.copyWith(followAuthor: !state.followAuthor));
            final Result<List<Author>> changeFollowResult =
            await _changeFollowAuthorUseCase.call(
              params: ChangeFollowAuthorParam(authorName),
            );
            if (changeFollowResult.success) {
              final Result<List<Author>> listAuthorsResult =
              await _getListAuthorUseCase.call(
                params: GetListAuthorParam(state.searchKey ?? ''),
              );
              if (listAuthorsResult.success) {
                emit(state.copyWith(listAuthors: listAuthorsResult.data));
              } else {
                logger.d(
                  'có lỗi khi lấy listAuthors ${listAuthorsResult.failure}',
                );
              }
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
  final GetListTopicUseCase _getListTopicUseCase;
  final GetListAuthorUseCase _getListAuthorUseCase;
  final ChangeSaveTopicUseCase _changeSaveTopicUseCase;
  final ChangeFollowAuthorUseCase _changeFollowAuthorUseCase;
}
