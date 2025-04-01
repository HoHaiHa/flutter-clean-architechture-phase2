part of 'notification_bloc.dart';

@freezed
class NotificationState extends BaseState with _$NotificationState {
  const NotificationState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listNotificatioFollowDay,
    this.followState = false,
  });

  @override
  final LinkedHashMap<String, List<AppNotification>>? listNotificatioFollowDay;
  @override
  final bool followState;
}