import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/comment/component/comment.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import '../../../router/router.dart';
import 'comment_bloc.dart';

@RoutePage()
class CommentPage extends BasePage<CommentBloc, CommentEvent, CommentState> {
  const CommentPage({Key? key, required this.newsId}) : super(key: key);
  final String newsId;

  @override
  void onInitState(BuildContext context) {
    final newsId = context.routeData.argsAs<CommentRouteArgs>().newsId;
    context.read<CommentBloc>().add(CommentEvent.loadData(newsId));
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final TextEditingController _commentController = TextEditingController();

    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return SafeArea(
      child: Scaffold(
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
            style: textTheme?.textMedium?.copyWith(
              color: colorSchema?.darkBlack,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BlocBuilder<CommentBloc, CommentState>(
                    buildWhen: (preState, state) {
                      return preState.listComments != state.listComments;
                    },
                    builder: (context, state) {
                      return ListViewComment(
                        listComments: state.listComments ?? [],
                      );
                    },
                  ),
                ),
              ),
            ),

            BlocBuilder<CommentBloc, CommentState>(
              buildWhen: (preState, state) {
                return preState.commentInput != state.commentInput ||
                    preState.enableSendComment != state.enableSendComment;
              },
              builder: (context, state) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  height: 78,
                  decoration: BoxDecoration(
                    color: colorSchema?.grayscaleWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: AppFormField(
                          value: state.commentInput,
                          onChanged: (value) {
                            context.read<CommentBloc>().add(
                              CommentEvent.changeCommentInput(value),
                            );
                          },
                          controller: _commentController,
                          decoration: const InputDecoration(
                            hintText: 'Type your comment',
                          ),
                          centerVertical: true,
                        ),
                      ),
                      const Gap(5),
                      InkWell(
                        onTap:
                            state.enableSendComment
                                ? () {
                                  context.read<CommentBloc>().add(CommentEvent.sendComment(newsId));
                                }
                                : null,
                        child: Assets.icons.iconSendComment.svg(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
