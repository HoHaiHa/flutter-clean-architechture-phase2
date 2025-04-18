part of 'settings_bloc.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadData() = _LoadData;
  const factory SettingsEvent.changeDarkMode() = _ChangeDarkMode;

}