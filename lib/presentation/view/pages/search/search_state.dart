part of 'search_bloc.dart';

@freezed
class SearchState extends BaseState with _$SearchState {
  const SearchState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listTopics,
    this.listNews,
    this.tab,
    this.followAuthor = false,
    this.listAuthors,
    this.saveTopic = false,
    this.searchKey,
  });

  @override
  final List<News>? listNews ;
  final List<Topic>? listTopics;
  final List<Author>? listAuthors ;
  final String? tab;
  final String? searchKey;
  final bool saveTopic;
  final bool followAuthor;
}