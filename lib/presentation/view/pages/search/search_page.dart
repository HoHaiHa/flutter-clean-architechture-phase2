import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/search/component/author.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/search/component/toppic_list.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/list_news.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 24, left: 24, top: 24),
              child: Column(
                children: [
                  BlocBuilder<SearchBloc, SearchState>(
                    buildWhen: (preState, state) {
                      return preState != state;
                    },
                    builder: (context, state) {
                      return AppFormField(
                        value: state.searchKey,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Assets.icons.search.svg(),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => context.pop(),
                            child:Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Assets.icons.closeSearch.svg(),
                            ),
        
                          ),
                        ),
                        onChanged: (value) {
                          context.read<SearchBloc>().add(
                            SearchEvent.changeSearchKey(value),
                          );
                        },
                      );
                    },
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
                unselectedLabelStyle: textTheme?.textMedium,
                unselectedLabelColor: colorSchema?.grayscaleBodyText,
                labelPadding: EdgeInsets.zero,
                tabs: const <Widget>[
                  Tab(text: 'News'),
                  Tab(text: 'Topic'),
                  Tab(text: 'Author'),
                ],
              ),
            ),
            Gap(16),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return TabBarView(
                    children: [
                      ListNews(listNews: state.listNews ?? []),
                      TopicList(state.listTopics ?? []),
                      AuthorList(state.listAuthors ?? []),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
