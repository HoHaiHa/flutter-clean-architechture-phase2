import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/list_news.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import '../../widgets/app_button.dart';
import 'profile_bloc.dart';

@RoutePage()
class ProfilePage extends BasePage<ProfileBloc, ProfileEvent, ProfileState> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<ProfileBloc>().add(const ProfileEvent.loadData());
    super.onInitState(context);
  }



  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor =Theme.of(context).iconTheme.color;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Colors.transparent,
            title: Text(
              'Profile',
              style: textTheme?.textMedium?.copyWith(
                color: colorSchema?.darkBlack,
              ),
            ),
            actions: [
              InkWell(
                onTap: (){
                  context.pushRoute(const SettingsRoute());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Assets.icons.settingIcon.svg(color: iconColor),
                ),
              ),
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      buildWhen: (preState, state) {
                        return preState.currentUser != state.currentUser;
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipOval(
                                      child: (state.currentUser?.imagePath ?? '').startsWith(
                                        'http',
                                      )
                                          ? Image.network(
                                        state.currentUser?.imagePath ?? '',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/default_img_user.jpg',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                          : Image.file(
                                        File(state.currentUser?.imagePath ?? ''),
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/default_img_user.jpg',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Gap(24),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '2156',
                                              style: textTheme?.textMediumLink
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            Text(
                                              'Followers',
                                              style: textTheme?.textMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '567',
                                              style: textTheme?.textMediumLink
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            Text(
                                              'Following',
                                              style: textTheme?.textMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              state.listNews?.length
                                                      .toString() ??
                                                  '0',
                                              style: textTheme?.textMediumLink
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            Text(
                                              'News',
                                              style: textTheme?.textMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Gap(16),
                              Text(
                                state.currentUser?.fullName ?? '',
                                style: textTheme?.textMediumLink?.copyWith(
                                  color: colorSchema?.darkBlack,
                                ),
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: textTheme?.textMedium?.copyWith(
                                  color: colorSchema?.grayscaleBodyText,
                                ),
                              ),
                              Gap(16),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppButton.primary(
                                      title: 'Edit profile',
                                      onPressed: () {
                                        context.pushRoute(EditProfileRoute());
                                      },
                                      height: 50,
                                      backgroundColor:
                                          colorSchema?.primaryDefault,
                                    ),
                                  ),
                                  Gap(16),
                                  Expanded(
                                    child: AppButton.primary(
                                      title: 'Website',
                                      onPressed: () {},
                                      height: 50,
                                      backgroundColor:
                                          colorSchema?.primaryDefault,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(5),
                              Center(
                                child: TabBar(
                                  padding: const EdgeInsets.only(left: 24),
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  isScrollable: true,
                                  indicatorColor: colorSchema?.primaryDefault,
                                  indicatorWeight: 4,
                                  labelStyle: textTheme?.textMedium,
                                  labelColor:Theme.of(context).brightness == Brightness.light ? colorSchema?.darkBlack : colorSchema?.darkmodeTitle,
                                  unselectedLabelStyle: textTheme?.textMedium
                                      ?.copyWith(
                                        color: colorSchema?.grayscaleBodyText,
                                      ),

                                  tabs: const [Text('News'), Text('Recent')],
                                ),
                              ),
                              Gap(13),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
            body: BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (preState, state) {
                return preState.listNews != state.listNews;
              },
              builder: (context, state) {
                return TabBarView(
                  children: [
                    ListNews(listNews: state.listNews ?? []),
                    ListNews(listNews: state.listNews ?? []),
                  ],
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Assets.icons.add.svg(),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
