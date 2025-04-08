import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/extension/datetime.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/news.dart';
import '../../../gen/assets.gen.dart';
import '../../router/router.dart';

class ListNews extends StatelessWidget {

  const ListNews({super.key, required this.listNews});
  final List<News> listNews;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listNews.length,
      itemBuilder: (context, index) {
        return NewsWidget(
          news:listNews[index],
        );
      },
    );
  }
}

class NewsWidget extends StatelessWidget {

  const NewsWidget({
    super.key,
    required this.news,
  });
  final News news;
  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return InkWell(
      onTap: (){
        context.router.push(DetailRoute(newsId: news.id));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
                            news.imagePath,
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
                            height: 22,
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              textAlign: TextAlign.left,
                              news.topic,
                              style: textTheme?.textXSmall?.copyWith(
                                color: colorSchema?.grayscaleBodyText,
                              ),
                            ),
                          ),
                          Text(
                            news.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: textTheme?.textMedium?.copyWith(
                              color: colorSchema?.darkBlack,
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
                                    news.user.imagePath,
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
                                constraints: BoxConstraints(maxWidth: 100),
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  news.user.brandName,
                                  style: textTheme?.textXSmallLink?.copyWith(
                                    color: colorSchema?.grayscaleBodyText,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              SizedBox(height:14,width: 14,child: Assets.icons.iconTimeTypeOutline.svg(color: Theme.of(context).iconTheme.color,)),
                              SizedBox(width: 4),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                news.timePost.getDayAgo(),
                                style: textTheme?.textXSmall?.copyWith(
                                  color: colorSchema?.grayscaleBodyText,
                                ),
                              ),
                              Spacer(),
                              Transform.translate(
                                offset: Offset(0, -3),
                                child: Text(
                                  '...',
                                  style: TextStyle(letterSpacing: 1.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
