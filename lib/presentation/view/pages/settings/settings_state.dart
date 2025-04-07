part of 'settings_bloc.dart';

@freezed
class SettingsState extends BaseState with _$SettingsState {
  const SettingsState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}