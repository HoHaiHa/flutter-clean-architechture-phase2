import 'dart:collection';
import 'package:flutter_clean_architecture/domain/entities/app_notification.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_follow_notification_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_all_notification_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

@injectable
class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  NotificationBloc(
    this._getAllNotificationUseCase,
    this._changeFollowNotificationUserUseCase,
  ) : super(const NotificationState()) {
    on<NotificationEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));

            final LinkedHashMap<String, List<AppNotification>> groupedNotifications =
                await _getAllNotificationUseCase.call(
                  params: GetAllNotificationParam(),
                );

            emit(
              state.copyWith(listNotificatioFollowDay: groupedNotifications),
            );
            break;
          case _ChangeFollowed(actorId: final actorId):
            await _changeFollowNotificationUserUseCase.call(
              params: ChangeFollowNotificationUserParam(actorId),
            );
            emit(state.copyWith(followState: !state.followState));
            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final GetAllNotificationUseCase _getAllNotificationUseCase;
  final ChangeFollowNotificationUserUseCase
  _changeFollowNotificationUserUseCase;
}
