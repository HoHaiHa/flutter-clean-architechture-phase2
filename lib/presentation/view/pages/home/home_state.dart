part of 'home_bloc.dart';

@freezed
class HomeState extends BaseState with _$HomeState {
  const HomeState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.topic,
    this.listNews,
    required this.listTopics,
  });


  @override
  final String? topic;
  @override
  final List<News>? listNews;
  @override
  final List<Topic> listTopics;
}