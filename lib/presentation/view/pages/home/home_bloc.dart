import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_list_news_by_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_list_topic_saved_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/news.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../../shared/common/error_entity/error_entity.dart';
import '../../../../shared/common/error_entity/validation_error_entity.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._getListNewsByTopicUseCase, this._getListTopicSavedUseCase)
    : super(const HomeState(listTopics: [])) {
    on<HomeEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            final List<Topic> topicResult = await _getListTopicSavedUseCase
                .call(params: GetListTopicSavedParam());
            final List<News> newsResult = await _getListNewsByTopicUseCase.call(
              params: GetListNewsByTopicParam(''),
            );
            emit(state.copyWith(listTopics: topicResult));
            emit(state.copyWith(listNews: newsResult));
            break;
          case _ChangTab(topic: final topic):
            final List<News> newsResult = await _getListNewsByTopicUseCase.call(
              params: GetListNewsByTopicParam(topic ?? ''),
            );
            emit(state.copyWith(listNews: newsResult));
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final GetListTopicSavedUseCase _getListTopicSavedUseCase;
  final GetListNewsByTopicUseCase _getListNewsByTopicUseCase;


  @override
  void handleError<S>(Emitter<S> emit, Object error) {
    if (error is ValidationErrorEntity) {
    } else {
      final message = error is ErrorEntity ? error.message : 'Error something..';
    }
  }

}

