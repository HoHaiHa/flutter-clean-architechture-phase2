
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';

class Comment2 extends StatelessWidget {
  const Comment2({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  'https://cdn-media.sforum.vn/storage/app/media/anh-dep-116.jpg',
                ),
              ),
              Gap(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      'Wilson Franci',
                      style: textTheme?.textMediumLink?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    const Gap(2),
                    Text(
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: textTheme?.textMedium?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    Gap(4),
                    Row(
                      children: [
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '4w',
                          style: textTheme?.textXSmall?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),
                        ),
                        Gap(12),
                        Assets.icons.heartMini.svg(),
                        Gap(3),
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '125 likes',
                          style: textTheme?.textXSmall?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),
                        ),
                        Gap(12),
                        Assets.icons.iconsReplyMini.svg(),
                        Gap(3),
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          'reply',
                          style: textTheme?.textXSmall?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
