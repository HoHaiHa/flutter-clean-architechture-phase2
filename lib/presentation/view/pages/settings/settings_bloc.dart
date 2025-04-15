import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/usecases/check_current_theme_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._checkCurrentThemeUseCase) : super(const SettingsState()) {
    on<SettingsEvent>((event, emit)  async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              final ThemeMode themeMode =  await _checkCurrentThemeUseCase.call(params: CheckCurrentThemeParam());
              if(themeMode== ThemeMode.dark)
                emit(state.copyWith(darkMode: true));
              else
                emit(state.copyWith(darkMode: false));
              break;
            case _ChangeDarkMode():
              emit(state.copyWith(darkMode: !state.darkMode));

              break;
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
  final CheckCurrentThemeUseCase _checkCurrentThemeUseCase;
}