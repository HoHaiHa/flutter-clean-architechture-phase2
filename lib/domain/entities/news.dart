import 'package:json_annotation/json_annotation.dart';

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


}