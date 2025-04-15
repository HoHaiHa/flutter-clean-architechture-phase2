import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import '../../../router/router.dart';
import '../../widgets/app_bottom_navigation_bar.dart';
import 'main_wrapper_page_bloc.dart';

@RoutePage()
class MainWrapperPagePage extends BasePage<MainWrapperPageBloc, MainWrapperPageEvent, MainWrapperPageState> {
  const MainWrapperPagePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<MainWrapperPageBloc>().add(const MainWrapperPageEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor =Theme.of(context).iconTheme.color;

    final List<AppBottomNavigationItem> _bottomNavItems = [
      AppBottomNavigationItem(
        label: 'Home',
        icon: Assets.icons.iconHomeTypeOutline.svg(color: iconColor),
        selectedIcon: Assets.icons.iconHomeTypeFilled.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const HomeRoute(),
      ),
      AppBottomNavigationItem(
        label: 'Explore',
        icon: Assets.icons.iconCompassTypeOutline.svg(color: iconColor),
        selectedIcon: Assets.icons.iconCompassTypeFilled.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const ExploreRoute(),
      ),
      AppBottomNavigationItem(
        label: 'Bookmark',
        icon: Assets.icons.iconBookmarkTypeOutline.svg(color: iconColor),
        selectedIcon: Assets.icons.iconBookmarkTypeFilled.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const BookmarkRoute(),
      ),
      AppBottomNavigationItem(
        label: 'Profile',
        icon: Assets.icons.iconProfileTypeOutline.svg(color: iconColor),
        selectedIcon: Assets.icons.iconProfileTypeFilled.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const ProfileRoute(),
      ),
    ];
    return AutoTabsRouter.tabBar(
      routes: _bottomNavItems.map((e) => e.page).toList(),
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: AppBottomNavigationBar(
            items: _bottomNavItems,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
          ),
        );
      },
    );
  }
}