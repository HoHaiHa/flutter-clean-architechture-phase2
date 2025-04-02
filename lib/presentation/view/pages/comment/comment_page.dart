import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import 'comment_bloc.dart';

@RoutePage()
class CommentPage extends BasePage<CommentBloc, CommentEvent, CommentState> {
  const CommentPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<CommentBloc>().add(const CommentEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: context.pop,
          icon: Assets.icons.backIcon.svg(),
        ),
        title: Text(
          "Comment",
          style: textTheme?.textMedium?.copyWith(color: colorSchema?.darkBlack),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemCount: 9,
              itemBuilder: (_, int index) {
                return Comment();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 78,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SafeArea(
              bottom: true,
              child: Row(
                children: [
                  Expanded(child: AppFormField()),
                  Assets.icons.iconSendComment.svg(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({super.key});

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
                    Gap(8),
                    Comment2(),
                    Gap(8),
                    Text(
                      'See more (2)',
                      style: textTheme?.textMedium?.copyWith(
                        color: colorSchema?.grayscaleBodyText,
                      ),
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
