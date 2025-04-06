import 'package:flutter_clean_architecture/domain/repositories/app_notification_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeFollowNotificationUserUseCase extends UseCase<void, ChangeFollowNotificationUserParam> {
  ChangeFollowNotificationUserUseCase(this._appNotificationRepository);
  AppNotificationRepository _appNotificationRepository;

  @override
  Future<bool> call({required ChangeFollowNotificationUserParam params}) async {
    return _appNotificationRepository.changeFollowNotificationUser(params.userId);
  }
}

class ChangeFollowNotificationUserParam {
  ChangeFollowNotificationUserParam(
  this.userId,
      );
  final String userId;
}