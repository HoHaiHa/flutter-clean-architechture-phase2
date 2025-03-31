
import '../entities/news.dart';

abstract interface class NewsRepository{
  Future<List<News>> getListNewByTopic({topic});
  Future<List<News>> searchNewByTopic({required key});
}