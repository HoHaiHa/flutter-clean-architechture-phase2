import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
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
    return SafeArea(
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
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Assets.icons.settingIcon.svg(),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipOval(
                                child: Image.network(
                                  'https://d1hjkbq40fs2x4.cloudfront.net/2016-01-31/files/1045-2.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(24),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '2156',
                                        style: textTheme?.textMediumLink
                                            ?.copyWith(
                                              color: colorSchema?.darkBlack,
                                            ),
                                      ),
                                      Text(
                                        'Followers',
                                        style: textTheme?.textMedium?.copyWith(
                                          color: colorSchema?.grayscaleBodyText,
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
                                              color: colorSchema?.darkBlack,
                                            ),
                                      ),
                                      Text(
                                        'Following',
                                        style: textTheme?.textMedium?.copyWith(
                                          color: colorSchema?.grayscaleBodyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '23',
                                        style: textTheme?.textMediumLink
                                            ?.copyWith(
                                              color: colorSchema?.darkBlack,
                                            ),
                                      ),
                                      Text(
                                        'News',
                                        style: textTheme?.textMedium?.copyWith(
                                          color: colorSchema?.grayscaleBodyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
          body: ListView.builder(itemBuilder: (context, index) {}),
        ),
      ),
    );
  }
}
