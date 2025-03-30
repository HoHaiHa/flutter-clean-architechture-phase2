import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/repositories/topic_repository.dart';
import 'package:flutter_clean_architecture/shared/common/result.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetListTopicUseCase extends UseCase<void, GetListTopicParam> {
  GetListTopicUseCase(this._topicRepository);

  final TopicRepository _topicRepository;

  @override
  Future<Result<List<Topic>>> call({required GetListTopicParam params}) async {
    return _topicRepository.getListTopic(params.key);
  }
}

class GetListTopicParam {
  GetListTopicParam(
      this.key,
      );
  final String key;
}