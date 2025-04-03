import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/extension/datetime.dart';
import 'package:flutter_clean_architecture/shared/extension/number.dart';
import 'package:gap/gap.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import '../../../router/router.dart';
import 'detail_bloc.dart';

@RoutePage()
class DetailPage extends BasePage<DetailBloc, DetailEvent, DetailState> {
  const DetailPage({Key? key, required this.newsId}) : super(key: key);
  final String newsId;

  @override
  void onInitState(BuildContext context) {
    final newsId = context.routeData.argsAs<DetailRouteArgs>().newsId;
    context.read<DetailBloc>().add(DetailEvent.loadData(newsId));
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            leading: IconButton(
              onPressed: context.pop,
              icon: Assets.icons.backIcon.svg(),
            ),
            actions: [
              IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Assets.icons.iconShareTypeOutline.svg(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  icon:
                      Assets.icons.iconMoreVerTypeOutline.svg(), // Icon dấu "..."
                  onSelected: (value) {
                    print("Selected: $value");
                  },
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(value: "Settings", child: Text("Settings")),
                        PopupMenuItem(value: "Logout", child: Text("Logout")),
                      ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipOval(
                          child: Image.network(
                            state.newsDetail?.author.imagePath ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Gap(2.5),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.newsDetail?.author.brandName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme?.textMediumLink?.copyWith(
                                color: colorSchema?.darkBlack,
                              ),
                            ),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              state.newsDetail?.timePost.getDayAgo() ?? '',
                              style: textTheme?.textSmall?.copyWith(
                                color: colorSchema?.grayscaleBodyText,
                              ),
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          context.read<DetailBloc>().add(
                            DetailEvent.changeFollow(
                              state.newsDetail?.author.brandName ?? '',
                            ),
                          );
                        },
                        child:
                            state.newsDetail?.author.isFollow ?? false
                                ? Assets.icons.following.svg()
                                : Assets.icons.followIcon.svg(),
                      ),
                    ],
                  ),
                  Gap(16),

                  Container(
                    height: 248,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: NetworkImage(state.newsDetail?.imagePath ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(16),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    state.newsDetail?.topic ?? '',
                    style: textTheme?.textSmall?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                  ),
                  Gap(4),
                  Text(
                    state.newsDetail?.title ?? '',
                    style: textTheme?.textDisplaySmall?.copyWith(
                      color: colorSchema?.darkBlack,
                    ),
                  ),
                  const Gap(16),
                  Text(
                    state.newsDetail?.content ?? '',
                    style: textTheme?.textMedium?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read<DetailBloc>().add(const DetailEvent.changeLike());
                  },
                  child: Assets.icons.iconHeartTypeFilled.svg(
                    color:
                        state.likeState
                            ? Colors.red
                            : colorSchema?.grayscaleBodyText,
                  ),
                ),
                const Gap(4),
                Expanded(
                  flex: 0,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    state.newsDetail?.userLikeId.length.getNumberk() ?? '',
                    style: textTheme?.textMedium?.copyWith(
                      color: colorSchema?.grayscaleTitleactive,
                    ),
                  ),
                ),
                const Gap(30),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      context.router.push(CommentRoute(newsId: state.newsDetail?.id ??''));
                    },
                    child: Row(
                      children: [
                        Assets.icons.iconCommentTypeOutline.svg(),
                        Gap(4),
                        Text(
                          '1K',
                          style: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.grayscaleTitleactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<DetailBloc>().add(
                      const DetailEvent.changeSave(),
                    );
                  },
                  child: SizedBox(
                    width: 70,
                    child: Assets.icons.iconBookmarkTypeFilled.svg(
                      color:
                          state.saveState
                              ? colorSchema?.primaryDefault
                              : colorSchema?.grayscaleBodyText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
