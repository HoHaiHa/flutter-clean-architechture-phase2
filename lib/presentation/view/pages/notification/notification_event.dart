part of 'notification_bloc.dart';

@freezed
sealed class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadData() = _LoadData;
  const factory NotificationEvent.changeFollowed() = _ChangeFollowed;
}