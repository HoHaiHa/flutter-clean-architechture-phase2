import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class LogoutUseCase extends UseCase<void, LogoutParam> {
  LogoutUseCase();

  @override
  Future<bool> call({required LogoutParam params}) async {
    // TODO
    return false;
  }
}

class LogoutParam {
  LogoutParam();
}