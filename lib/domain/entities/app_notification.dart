import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.g.dart';

@JsonSerializable()
class AppNotification {
  String notificationId;
  String imagePath;
  Author author;
  String message;
  DateTime timeNotify;
  String typeNotification;

  AppNotification(
    this.notificationId,
    this.imagePath,
    this.author,
    this.message,
    this.timeNotify,
    this.typeNotification,
  );

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$AppNotificationToJson(this);

  String _getMonthName() {
    return DateFormat.MMMM("en").format(timeNotify);
  }

  String notifyDay() {
    final duration = DateTime.now().difference(timeNotify);
    final durationForYear = DateTime.now();
    if (duration.inDays == 0) {
      return 'Today, ${_getMonthName()} ${timeNotify.day}';
    }
    if (duration.inDays == 1) {
      return 'Yesterday, ${_getMonthName()} ${timeNotify.day}';
    }
    if (durationForYear.year == timeNotify.year) {
      return '${_getMonthName()} ${timeNotify.day}';
    } else {
      return '${_getMonthName()} ${timeNotify.day} ${timeNotify.year}';
    }
  }
}
