import 'package:injectable/injectable.dart';
import '../../domain/repositories/notification_repository.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl();
}