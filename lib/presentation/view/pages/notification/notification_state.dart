part of 'notification_bloc.dart';

@freezed
class NotificationState extends BaseState with _$NotificationState {
  const NotificationState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listNotifications,
    this.isFollowed = false,
  });

  @override
  final  List<Notification>? listNotifications;
  @override
  final bool isFollowed;
}