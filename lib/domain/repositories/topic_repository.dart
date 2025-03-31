
import 'package:flutter_clean_architecture/shared/common/result.dart';

import '../entities/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> getListTopic(String key);
  Future<List<Topic>> getListTopicSaved();
  Future<Result<void>> changeSaveTopic(String topicName);
}
