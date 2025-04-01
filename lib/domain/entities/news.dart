import 'package:json_annotation/json_annotation.dart';

import 'author.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String id;
  final String imagePath;
  final String topic;
  final String title;
  final Author author;
  final DateTime timePost;
  final String content;
  final List<String> userLikeId;

  const News({
    required this.id,
    required this.imagePath,
    required this.topic,
    required this.title,
    required this.author,
    required this.timePost,
    required this.content,
    required this.userLikeId,
  });
}