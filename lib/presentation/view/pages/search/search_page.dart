import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/search/component/toppic_list.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/list_news.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import 'component/user.dart';
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
    final iconColor =Theme.of(context).iconTheme.color;
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
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
                          autofocus: true,
                          value: state.searchKey,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Assets.icons.search.svg(color: iconColor),
                            suffixIcon: InkWell(
                              onTap: () => context.pop(),
                              child:Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Assets.icons.closeSearch.svg(color: iconColor),
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
              Center(
                child: TabBar(
                  indicatorWeight: 4.0,
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  labelPadding: const EdgeInsets.only(
                      top: 0,
                      right: 12,
                      left: 12,
                      bottom: 8,
                  ),
                  indicatorSize:
                  TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor:
                  colorSchema?.primaryDefault,
                  labelStyle: textTheme?.textMedium,
                  labelColor:Theme.of(context).brightness == Brightness.light ? colorSchema?.darkBlack : colorSchema?.darkmodeTitle,
                  unselectedLabelStyle: textTheme
                      ?.textMedium
                      ?.copyWith(
                    color:
                    colorSchema
                        ?.grayscaleBodyText,
                  ),

                  tabs: const [
                    Text('News'),
                    Text('Topics'),
                    Text('Author'),
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
                        UserList(state.listUsers ?? []),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
