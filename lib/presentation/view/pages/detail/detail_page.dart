import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import 'detail_bloc.dart';

@RoutePage()
class DetailPage extends BasePage<DetailBloc, DetailEvent, DetailState> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<DetailBloc>().add(const DetailEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
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
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            icon: Assets.icons.iconMoreVerTypeOutline.svg(), // Icon dấu "..."
            onSelected: (value) {
              print("Selected: $value");
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(value: "Settings", child: Text("Settings")),
                  PopupMenuItem(value: "Logout", child: Text("Logout")),
                ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      width: 50,
                      height: 50,
                      'https://cdn-media.sforum.vn/storage/app/media/anh-dep-116.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap(2.5),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BBC News',
                          style: textTheme?.textMediumLink?.copyWith(
                            color: colorSchema?.darkBlack,
                          ),
                        ),
                        Text(
                          '14m ago',
                          style: textTheme?.textSmall?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Assets.icons.following.svg(),
                ],
              ),
              Gap(16),
              Container(
                height: 248,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://cdn-media.sforum.vn/storage/app/media/anh-dep-116.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(16),
              Text(
                'Europe',
                style: textTheme?.textSmall?.copyWith(
                  color: colorSchema?.grayscaleBodyText,
                ),
              ),
              Gap(4),
              Text(
                'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
                style: textTheme?.textDisplaySmall?.copyWith(
                  color: colorSchema?.darkBlack,
                ),
              ),
              Gap(16),
              Text(
                'Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of "earning their money in other people\'s blood\n\nIn an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.\n\nThere has been a growing frustration among Ukraine\' leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.',
                style: textTheme?.textMedium?.copyWith(
                  color: colorSchema?.grayscaleBodyText,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
        child: Row(
          children: [
            Assets.icons.iconHeartTypeFilled.svg(color: Colors.red),
            Gap(4),
            Text(
              '24.5K',
              style: textTheme?.textMedium?.copyWith(
                color: colorSchema?.grayscaleTitleactive,
              ),
            ),
            Gap(30),
            Expanded(
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
            SizedBox(
              width: 70,
              child: Assets.icons.iconBookmarkTypeFilled.svg(
                color: colorSchema?.primaryDefault,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
