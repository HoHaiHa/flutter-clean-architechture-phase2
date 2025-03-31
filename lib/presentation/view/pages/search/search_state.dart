part of 'search_bloc.dart';

@freezed
class SearchState extends BaseState with _$SearchState {
  const SearchState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listTopics,
    this.listNews,
    this.followAuthor = false,
    this.listAuthors,
    this.saveTopic = false,
    this.searchKey,
  });

  @override
  final List<News>? listNews ;
  @override
  final List<Topic>? listTopics;
  @override
  final List<Author>? listAuthors ;
  @override
  final String? searchKey;
  @override
  final bool saveTopic;
  @override
  final bool followAuthor;
}