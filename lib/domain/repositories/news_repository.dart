import 'package:flutter_clean_architecture/shared/common/result.dart';

import '../entities/news.dart';

abstract interface class NewsRepository{
  Future<List<News>> getListNewByTopic({topic});
  Future<Result<List<News>>> searchNewByTopic({required key});
}