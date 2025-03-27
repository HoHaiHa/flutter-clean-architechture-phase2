import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/fakeNews.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/search/component/author.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/search/component/toppic_list.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/list_news.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../domain/entities/news.dart';
import '../../../../domain/entities/topic.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import 'search_bloc.dart';

@RoutePage()
class SearchPage extends BasePage<SearchBloc, SearchEvent, SearchState> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<SearchBloc>().add(const SearchEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    final List<News> listNews= FakeApi.LIST_NEWS;

    final List<Topic> listTopic = FakeApi.topics;

    final List<Author> listAuthor = FakeApi.authors;

    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 24, left: 24, top: 24),
            child: Column(
              children: [
                AppFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Assets.icons.search.svg(),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: InkWell(
                        onTap: () => context.pop(),
                        child: Assets.icons.closeSearch.svg(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(16),
          SizedBox(
            width: 178,
            height: 34,
            child: TabBar(
              labelStyle: textTheme?.textMedium,
              labelColor: colorSchema?.darkBlack,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelStyle:textTheme?.textMedium,
              unselectedLabelColor: colorSchema?.grayscaleBodyText,
              labelPadding: EdgeInsets.zero,
              tabs: <Widget>[
                Tab(text: 'News'),
                Tab(text: 'Topic'),
                Tab(text: 'Author'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListNews(listNews: listNews),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TopicList( listTopic),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AuthorList( listAuthor),
              )
            ],),
          )
        ],
      ),
    );
  }
}
