import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_save_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_all_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_all_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/search_news_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/news.dart';
import '../../../../domain/usecases/change_follow_user_use_case.dart';
import '../../../../shared/common/error_converter.dart';
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
    this._getAllUserUseCase,
    this._changeSaveTopicUseCase,
    this._changeFollowUserUseCase,
  ) : super(const SearchState()) {
    on<SearchEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            //emit(state.copyWith(pageStatus: PageStatus.Loaded));
            final List<News> listNewsResult = await _searchNewsUseCase.call(
              params: SearchNewsParam(''),
            );
            emit(state.copyWith(listNews: listNewsResult));
            final List<Topic> listTopicsResult = await _getAllTopicUseCase.call(
              params: GetAllTopicParam(''),
            );
            emit(state.copyWith(listTopics: listTopicsResult));
            final List<User> listUsersResult = await _getAllUserUseCase
                .call(params: GetAllUserParam(''));
            emit(state.copyWith(listUsers: listUsersResult));
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

            final List<User> listUsersResult = await _getAllUserUseCase
                .call(params: GetAllUserParam(state.searchKey ?? ''));
            emit(state.copyWith(listUsers: listUsersResult));

            break;
          case _ChangeSaveTopic(topicName: final topicName):
            emit(state.copyWith(saveTopic: !state.saveTopic));
            await _changeSaveTopicUseCase.call(
              params: ChangeSaveTopicParam(topicName),
            );

            final List<Topic> listTopicResult = await _getAllTopicUseCase.call(
              params: GetAllTopicParam(state.searchKey ?? ''),
            );

            emit(state.copyWith(listTopics: listTopicResult));
            break;
          case _ChangeFollowUser(userName: final userName):
            emit(state.copyWith(followUser: !state.followUser));
            await _changeFollowUserUseCase.call(
              params: ChangeFollowUserParam(userName),
            );

            final List<User> listUsersResult = await _getAllUserUseCase
                .call(params: GetAllUserParam(state.searchKey ?? ''));
            emit(state.copyWith(listUsers: listUsersResult));

            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final SearchNewsUseCase _searchNewsUseCase;
  final GetAllTopicUseCase _getAllTopicUseCase;
  final GetAllUserUseCase _getAllUserUseCase;
  final ChangeSaveTopicUseCase _changeSaveTopicUseCase;
  final ChangeFollowUserUseCase _changeFollowUserUseCase;


}
