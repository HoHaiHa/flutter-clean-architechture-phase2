import 'package:auto_route/auto_route.dart';

import '../view/pages/wrap_home_group/wrap_home_group_page.dart';

import '../view/pages/main_wrapper_page/main_wrapper_page_page.dart';

import '../view/pages/edit_profile/edit_profile_page.dart';

import '../view/pages/settings/settings_page.dart';

import '../view/pages/explore/explore_page.dart';

import '../view/pages/bookmark/bookmark_page.dart';

import '../view/pages/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';

import '../view/pages/comment/comment_page.dart';

import '../view/pages/detail/detail_page.dart';

import '../view/pages/notification/notification_page.dart';

import '../view/pages/search/search_page.dart';

import '../view/pages/hello/hello_page.dart';

import '../view/pages/home/home_page.dart';
import '../view/pages/login/login_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Dialog|Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    //AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: DetailRoute.page),
    AutoRoute(page: CommentRoute.page),
    AutoRoute(page: HelloRoute.page),
    //AutoRoute(page: ProfileRoute.page),
    AutoRoute(
      page: MainWrapperRouteRoute.page,
      children: [
        AutoRoute(page: WrapHomeGroupRoute.page,children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: NotificationRoute.page),
        ]),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: BookmarkRoute.page),

        AutoRoute(page: ExploreRoute.page),
      ],
    ),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: EditProfileRoute.page),

  ];
}
