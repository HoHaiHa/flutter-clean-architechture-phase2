import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String imagePath;
  final String topic;
  final String title;
  final String brandImagePath;
  final String brandName;
  final DateTime timePost;

  const News({
    required this.imagePath,
    required this.topic,
    required this.title,
    required this.brandImagePath,
    required this.brandName,
    required this.timePost,
  });

  String timeAgo(){
    final duration  = DateTime.now().difference(this.timePost);
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


}