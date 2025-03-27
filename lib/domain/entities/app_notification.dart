import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.g.dart';

@JsonSerializable()
class AppNotification {
   String imagePath;
   String actor;
   bool isFollowed;
   String message;
   DateTime timeNotify;

  AppNotification(
    this.imagePath,
    this.actor,
    this.isFollowed,
    this.message,
    this.timeNotify,
  );

  factory AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$AppNotificationToJson(this);

  String timeAgo(){
    final duration  = DateTime.now().difference(this.timeNotify);
    if (duration.inDays >= 1) {
      return '${duration.inDays}d ago';
    } else if (duration.inHours >= 1) {
      return '${duration.inHours}h ago';
    } else if (duration.inMinutes >= 1) {
      return '${duration.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  int dayAgo(){
    return DateTime.now().difference(timeNotify).inDays;
  }

   String _getMonthName() {
     return DateFormat.MMMM("en").format(timeNotify);
   }

  String notifyDay(){
    final duration = DateTime.now().difference(timeNotify);
    final durationForYear = DateTime.now();
    if(duration.inDays == 0){
      return 'Today, ${_getMonthName()} ${timeNotify.day}';
    }
    if(duration.inDays == 1 ){
      return 'Yesterday, ${_getMonthName()} ${timeNotify.day}';
    }
    if(durationForYear.year ==  timeNotify.year ){
      return '${_getMonthName()} ${timeNotify.day}';
    }
    else{
      return '${_getMonthName()} ${timeNotify.day} ${timeNotify.year}';
    }
  }
}
