import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_list_news_by_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_list_topic_use_case.dart';
import 'package:flutter_clean_architecture/shared/common/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/news.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../../shared/utils/logger.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._getListTopicUseCase, this._getListNewsByTopicUseCase) : super(const HomeState(listTopics: [])) {
    on<HomeEvent>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              final Result<List<Topic>> topicResult = await _getListTopicUseCase.call(params: GetListTopicParam(''));
              final Topic fakeAll = Topic('', 'All', '', false);
              final Result<List<News>> NewsResult = await _getListNewsByTopicUseCase.call(params: GetListNewsByTopicParam('All'));

              if(topicResult.success){
                emit(state.copyWith(listTopics:[fakeAll,...?topicResult.data]));
              }
              else{
                logger.d('get topic Error ${topicResult.failure}');
              }

              if(NewsResult.success){
                emit(state.copyWith(listNews: NewsResult.data));
              }
              else{
                logger.d('get topic Error ${NewsResult.failure}');
              }

              break;
            case _ChangTab(topic: final topic):
              emit(state.copyWith(topic: topic));
              final Result<List<News>> NewsResult = await _getListNewsByTopicUseCase.call(params: GetListNewsByTopicParam(state.topic ?? 'All'));
              if(NewsResult.success){
                emit(state.copyWith(listNews: NewsResult.data));
              }
              else{
                logger.d('get topic Error ${NewsResult.failure}');
              }
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }

  final GetListTopicUseCase _getListTopicUseCase;
  final GetListNewsByTopicUseCase _getListNewsByTopicUseCase;
}