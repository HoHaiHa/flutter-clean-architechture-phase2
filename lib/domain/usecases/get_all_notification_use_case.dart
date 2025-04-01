import 'dart:collection';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_clean_architecture/domain/entities/app_notification.dart';
import 'package:flutter_clean_architecture/domain/repositories/app_notification_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetAllNotificationUseCase extends UseCase<void, GetAllNotificationParam> {
  GetAllNotificationUseCase(this._appNotificationRepository);

  final AppNotificationRepository _appNotificationRepository;
  @override
  Future<LinkedHashMap<String, List<AppNotification>>> call({required GetAllNotificationParam params}) async {
    final List<AppNotification> listNotifications =  await _appNotificationRepository.getAllNotification();
    listNotifications.sort((a, b) => b.timeNotify.compareTo(a.timeNotify));
    final LinkedHashMap<String, List<AppNotification>> groupedNotifications =
    LinkedHashMap();
    for (final notification in listNotifications) {
      final String formattedDate = DateFormat(
        'yyyy-MM-dd',
      ).format(notification.timeNotify);
      if (!groupedNotifications.containsKey(formattedDate)) {
        groupedNotifications[formattedDate] = [];
      }
      groupedNotifications[formattedDate]!.add(notification);
    }

    return groupedNotifications;
  }
}

class GetAllNotificationParam {
  GetAllNotificationParam();
}