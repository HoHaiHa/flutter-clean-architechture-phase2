import 'package:flutter_clean_architecture/domain/entities/current_user.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_current_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_news_of_current_user_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/news.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._getCurrentUserUseCase, this._getNewsOfCurrentUserUseCase) : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              final CurrentUser currentUser = await _getCurrentUserUseCase.call(params: GetCurrentUserParam());
              final List<News> listNews = await _getNewsOfCurrentUserUseCase.call(params: GetNewsOfCurrentUserParam());
              emit(state.copyWith(currentUser: currentUser,listNews: listNews));
              break;
            case _ChangeTab():
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetNewsOfCurrentUserUseCase _getNewsOfCurrentUserUseCase;

}