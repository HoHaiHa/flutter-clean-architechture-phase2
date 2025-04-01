
import '../entities/app_notification.dart';

abstract class AppNotificationRepository {
  Future<List<AppNotification>> getAllNotification();
  Future<bool> changeFollowNotificationUser(String actorId);
}