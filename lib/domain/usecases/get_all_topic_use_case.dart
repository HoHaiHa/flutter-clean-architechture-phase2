import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/repositories/topic_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetAllTopicUseCase extends UseCase<void, GetAllTopicParam> {
  GetAllTopicUseCase(this._topicRepository);

  final TopicRepository _topicRepository;

  @override
  Future<List<Topic>> call({required GetAllTopicParam params}) async {
    return _topicRepository.getListTopic(params.key);
  }
}

class GetAllTopicParam {
  GetAllTopicParam(
      this.key,
      );
  final String key;
}