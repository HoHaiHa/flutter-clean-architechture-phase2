part of 'bottom_navigation_bloc.dart';

@freezed
sealed class BottomNavigationEvent with _$BottomNavigationEvent {
  const factory BottomNavigationEvent.loadData() = _LoadData;
}