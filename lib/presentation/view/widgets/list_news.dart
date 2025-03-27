import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/news.dart';


class ListNews extends StatelessWidget{
  final List<News> listNews;

  const ListNews({
    super.key,
    required this.listNews,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsWidget(
          imagePath: listNews[index].imagePath,
          topic: listNews[index].topic,
          title: listNews[index].title,
          brandImagePath: listNews[index].brandImagePath,
          brandName: listNews[index].brandName,
          timePost: listNews[index].timePost,
        );
      },
    )
    ;
  }

}

class NewsWidget extends StatelessWidget{
  final String imagePath;
  final String topic;
  final String title;
  final String brandImagePath;
  final String brandName;
  final DateTime timePost;

  const NewsWidget({
    super.key,
    required this.imagePath,
    required this.topic,
    required this.title,
    required this.brandImagePath,
    required this.brandName,
    required this.timePost,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 8),
            width: 380,
            height: 112,
            child: Row(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Center(
                      child: Center(
                        child: Image.network(
                          width: 96,
                          height: 96,
                          fit: BoxFit.fitHeight,
                          imagePath,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return CircularProgressIndicator();
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(4),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height:22,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.left,
                            topic,
                            style: textTheme?.textXSmall?.copyWith(
                              color: colorSchema?.grayscaleBodyText
                            ),

                          ),
                        ),
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: textTheme?.textMedium?.copyWith(
                              color: colorSchema?.darkBlack
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: ClipOval(
                                child: Image.network(
                                  fit: BoxFit.fill,
                                  brandImagePath,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) return child;
                                    return CircularProgressIndicator();
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            ConstrainedBox(
                              constraints:BoxConstraints(
                                maxWidth: 100,
                              ),
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                brandName,
                                style: textTheme?.textXSmallLink?.copyWith(
                                    color: colorSchema?.grayscaleBodyText
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.schedule, size: 14),
                            SizedBox(width: 4),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              timeAgo(timePost),
                              style: textTheme?.textXSmall?.copyWith(
                                  color: colorSchema?.grayscaleBodyText
                              ),
                            ),
                            Spacer(),
                            Transform.translate(
                              offset: Offset(0, -3),
                              child: Text(
                                '...',
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
        Gap(16),
      ],
    );
  }
}

String timeAgo(DateTime timePost) {
  final duration = DateTime.now().difference(timePost);
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