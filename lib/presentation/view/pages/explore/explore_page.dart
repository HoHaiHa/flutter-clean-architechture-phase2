import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

import '../../../base/base_page.dart';
import 'explore_bloc.dart';

@RoutePage()
class ExplorePage extends BasePage<ExploreBloc, ExploreEvent, ExploreState> {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<ExploreBloc>().add(const ExploreEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return Center(
      child: Text('Explore',style: textTheme?.textLargeLink?.copyWith(color: colorSchema?.grayscaleBodyText),),
    );
  }
}