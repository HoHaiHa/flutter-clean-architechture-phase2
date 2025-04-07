
import '../entities/news.dart';

abstract interface class NewsRepository{
  Future<List<News>> getListNewByTopic({topic});
  Future<List<News>> searchNewByTopic({required key});
  Future<News> getNewsById(String newsId);
  Future<bool> checkLikeForCurrentUser(String newsId);
  Future<bool> changeLikeForCurrentUser(String newsId);
  Future<List<News>> getNewsOfCurrentUser();
}