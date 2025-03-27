import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/fakeNews.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../domain/entities/app_notification.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import 'notification_bloc.dart';

@RoutePage()
class NotificationPage
    extends BasePage<NotificationBloc, NotificationEvent, NotificationState> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<NotificationBloc>().add(const NotificationEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    final List<AppNotification> listNotifications = FakeApi.NOTIFICATIONS;

    listNotifications.sort((a, b) => b.timeNotify.compareTo(a.timeNotify));

    LinkedHashMap<String, List<AppNotification>> groupedNotifications =
        LinkedHashMap();

    for (var notification in listNotifications) {
      String formattedDate = DateFormat(
        'yyyy-MM-dd',
      ).format(notification.timeNotify);
      if (!groupedNotifications.containsKey(formattedDate)) {
        groupedNotifications[formattedDate] = [];
      }
      groupedNotifications[formattedDate]!.add(notification);
    }

    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 64),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(child: Assets.icons.backIcon.svg(), onTap: context.pop),
              Text(
                'Notifcation',
                style: textTheme?.textMediumLink?.copyWith(
                  color: colorSchema?.darkBlack,
                ),
              ),
              Assets.icons.threedotVertical.svg(),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: groupedNotifications.length,
              itemBuilder: (context, index) {
                var entry = groupedNotifications.entries.elementAt(index);
                List<AppNotification> subList = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subList[0].notifyDay(),
                      style: textTheme?.textMediumLink?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    Gap(16),
                    Column(
                      children:
                          subList.map((notification) {
                            print(subList);
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 99,
                                  decoration: BoxDecoration(
                                    color:
                                        colorSchema?.grayscaleSecondaryButton,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: ClipOval(
                                            child: Image.network(
                                              notification.imagePath,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Gap(16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text.rich(
                                                maxLines: 2 ,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: notification.actor,
                                                      style: textTheme?.textMediumLink?.copyWith(
                                                        color: colorSchema?.grayscaleTitleactive
                                                      )
                                                    ),
                                                    TextSpan(text: ' '),
                                                    TextSpan(
                                                      text: notification.message,
                                                        style: textTheme?.textMedium?.copyWith(
                                                            color: colorSchema?.grayscaleTitleactive
                                                        )
                                                    ),
                                                  ]
                                                ),
                                              ),
                                              Text(notification.timeAgo(),style: textTheme?.textXSmall?.copyWith(
                                                  color: colorSchema?.grayscaleBodyText
                                              ) ,)
                                            ],
                                          ),
                                        ),
                                        notification.isFollowed ? Assets.icons.followIcon.svg() :  SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                ),
                                Gap(16),
                              ],
                            );
                          }).toList(),
                    ),

                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
