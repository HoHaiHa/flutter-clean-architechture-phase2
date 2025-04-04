import 'package:auto_route/auto_route.dart';

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
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HelloRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: DetailRoute.page),
    AutoRoute(page: CommentRoute.page),
    AutoRoute(page: ProfileRoute.page),
  ];
}