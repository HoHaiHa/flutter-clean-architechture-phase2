import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
import '../../../../domain/entities/news.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import '../../widgets/list_news.dart';
import 'home_bloc.dart';

@RoutePage()
class HomePage extends BasePage<HomeBloc, HomeEvent, HomeState> {
  const HomePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen:
          (previousState, state) =>
              previousState.listTopics != state.listTopics,
      builder: (context, state) {
        return DefaultTabController(
          length: state.listTopics!.length + 1,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Padding(
                padding: const EdgeInsets.only(bottom: 57),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        right: 24,
                        left: 24,
                        bottom: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 99,
                            height: 30,
                            child: Assets.images.logo.svg(),
                          ),
                          InkWell(
                            onTap: () => context.pushRoute(NotificationRoute()),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Assets.icons.notify.svg(
                                fit: BoxFit.scaleDown,
                                width: 18,
                                height: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(16),
                    Expanded(
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (context, innerBoxIsScrolled) => [
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 24, left: 24),
                                  child: Column(
                                    children: [
                                      AppFormField(
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Assets.icons.search.svg(),
                                          ),
            
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                              right: 12,
                                            ),
                                            child: Assets.icons.threeLine.svg(),
                                          ),
                                        ),
                                        onTap:
                                            () =>
                                                context.pushRoute(SearchRoute()),
                                      ),
                                      Gap(16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Trending',
                                            style: textTheme?.textMediumLink
                                                ?.copyWith(
                                                  color: colorSchema?.darkBlack,
                                                ),
                                          ),
                                          Text(
                                            'See all',
                                            style: textTheme?.textSmall?.copyWith(
                                              color:
                                                  colorSchema?.grayscaleBodyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(16),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/images/ship.png',
                                              fit: BoxFit.fitHeight,
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Europe',
                                              style: textTheme?.textXSmall
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                            const Gap(4),
                                            Text(
                                              'Russian warship: Moskva sinks in Black Sea',
                                              style: textTheme?.textMedium
                                                  ?.copyWith(
                                                    color: colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            const Gap(4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    ClipOval(
                                                      child: Image.asset(
                                                        'assets/images/bbc.png',
                                                        height: 20,
                                                        width: 20,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    const Gap(4),
                                                    Text(
                                                      'BBC News',
                                                      style: textTheme
                                                          ?.textXSmallLink
                                                          ?.copyWith(
                                                            color:
                                                                colorSchema
                                                                    ?.grayscaleBodyText,
                                                          ),
                                                    ),
                                                    const Gap(8),
                                                    Assets.icons.clock.svg(),
                                                    const Gap(6),
                                                    Text(
                                                      '4h ago',
                                                      style: textTheme?.textXSmall
                                                          ?.copyWith(
                                                            color:
                                                                colorSchema
                                                                    ?.grayscaleBodyText,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Assets.icons.threedot.svg(),
                                              ],
                                            ),
                                            Gap(16),
                                          ],
                                        ),
                                      ),
                                      const Gap(4),
                                    ],
                                  ),
                                ),
                              ),
                              SliverAppBar(
                                pinned: true,
                                toolbarHeight: 0,
                                elevation: 0,
                                bottom: PreferredSize(
                                  preferredSize: const Size.fromHeight(90),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 24,
                                          left: 24,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Latest',
                                              style: textTheme?.textMediumLink
                                                  ?.copyWith(
                                                    color: colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            Text(
                                              'See all',
                                              style: textTheme?.textSmall
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(16),
                                      BlocBuilder<HomeBloc, HomeState>(
                                        buildWhen: (previousState, state) {
                                          return previousState.listTopics !=
                                              state.listTopics;
                                        },
                                        builder: (context, state) {
                                          return TabBar(
                                            padding: const EdgeInsets.only(
                                              left: 24,
                                            ),
                                            labelPadding: const EdgeInsets.only(
                                              right: 10,
                                            ),
                                            indicatorSize:
                                                TabBarIndicatorSize.label,
                                            isScrollable: true,
                                            indicatorColor:
                                                colorSchema?.primaryDefault,
                                            labelStyle: textTheme?.textMedium,
                                            labelColor: colorSchema?.darkBlack,
                                            unselectedLabelStyle: textTheme
                                                ?.textMedium
                                                ?.copyWith(
                                                  color:
                                                      colorSchema
                                                          ?.grayscaleBodyText,
                                                ),
            
                                            tabs: [
                                              const Tab(child: Text('All')),
                                              ...?state.listTopics?.map((topics) {
                                                return Tab(
                                                  child: Text(topics.topicName),
                                                );
                                              }).toList(),
                                            ],
                                            onTap: (index) {
                                              context.read<HomeBloc>().add(
                                                index != 0
                                                    ? HomeEvent.changeTab(
                                                      state
                                                          .listTopics![index - 1]
                                                          .topicName,
                                                    )
                                                    : const HomeEvent.changeTab(
                                                      '',
                                                    ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                        body: BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previousState, state) {
                            return previousState.listNews != state.listNews;
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: TabBarView(
                                children: [
                                  ListNews(
                                    listNews:
                                        state.listNews ??
                                        [
                                          News(
                                            imagePath: '',
                                            topic: '',
                                            title: '',
                                            author: Author('','', '', 0, false),
                                            timePost: DateTime(2022),
                                            content: '', id: '', userLikeId: [],
                                          ),
                                        ],
                                  ),
                                  ...?state.listTopics?.map((topics) {
                                    return Center(
                                      child: ListNews(
                                        listNews:
                                            state.listNews ??
                                            [
                                              News(
                                                imagePath: '',
                                                topic: '',
                                                title: '',
                                                author: Author('', '','', 0, false),
                                                timePost: DateTime(2022),
                                                content: '', id: '', userLikeId: [],
                                              ),
                                            ],
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
