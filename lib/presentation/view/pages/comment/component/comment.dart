import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/comment/comment_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';

class ListViewComment extends StatelessWidget {
  const ListViewComment({super.key, required this.listComments});
  final List<NewsComment> listComments;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          listComments.map((comment) {
            return Comment(newsComment: comment);
          }).toList(),
    );
  }
}

class Comment extends StatefulWidget {
  const Comment({super.key, required this.newsComment});
  final NewsComment newsComment;

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  bool showReply = false;

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.newsComment.replyToCommentId != '')
                SizedBox(width: 51),
              SizedBox(
                width: 40,
                height: 40,
                child: ClipOval(
                  child: Image.network(
                    fit: BoxFit.cover,
                    widget.newsComment.userComment.imagePath,
                  ),
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
                      widget.newsComment.userComment.brandName,
                      style: textTheme?.textMediumLink?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    const Gap(2),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.newsComment.replyToUserName,
                            style: textTheme?.textMediumLink?.copyWith(
                              color: colorSchema?.darkBlack,
                            ),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: widget.newsComment.content,
                            style: textTheme?.textMedium?.copyWith(
                              color: colorSchema?.darkBlack,
                            ),
                          ),
                        ],
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
                        BlocBuilder<CommentBloc, CommentState>(
                          buildWhen: (preState, state) {
                            return state.likeCommentState !=
                                preState.likeCommentState;
                          },
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                context.read<CommentBloc>().add(
                                  CommentEvent.changeLike(
                                    widget.newsComment.id,
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  if (widget.newsComment.checkUserLike(
                                    state.currentUserid,
                                  ))
                                    Assets.icons.iconHeartMiniLike.svg()
                                  else
                                    Assets.icons.iconHeartMiniDontLike.svg(color: iconColor),
                                  const Gap(3),
                                  Text(
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    '${widget.newsComment.userLikeId.length} likes',
                                    style: textTheme?.textXSmall?.copyWith(
                                      color: colorSchema?.grayscaleBodyText,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Gap(12),
                        InkWell(
                          onTap: () {
                            context.read<CommentBloc>().add(
                              CommentEvent.setReplyTo(
                                widget.newsComment.id,
                                widget.newsComment.userComment.brandName,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Assets.icons.iconsReplyMini.svg(color: iconColor),
                              const Gap(3),
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
                        ),
                      ],
                    ),
                    Gap(8),
                  ],
                ),
              ),
            ],
          ),
          if (widget.newsComment.replies.isNotEmpty && showReply)
            ListViewComment(listComments: widget.newsComment.replies),
          if (widget.newsComment.replies.isNotEmpty && !showReply) Gap(8),
          if (widget.newsComment.replies.isNotEmpty && !showReply)
            Padding(
              padding: const EdgeInsets.only(left: 51),
              child: InkWell(
                onTap: () {
                  setState(() {
                    showReply = true;
                  });
                },
                child: Text(
                  'See more (${widget.newsComment.totalDescendants})',
                  style: textTheme?.textMedium?.copyWith(
                    color: colorSchema?.grayscaleBodyText,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
