import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetNotificationUseCase extends UseCase<void, GetNotificationParam> {
  GetNotificationUseCase();

  @override
  Future<bool> call({required GetNotificationParam params}) async {
    // TODO
    return false;
  }
}

class GetNotificationParam {
  GetNotificationParam();
}