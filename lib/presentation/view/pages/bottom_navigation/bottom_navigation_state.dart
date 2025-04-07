part of 'bottom_navigation_bloc.dart';

@freezed
class BottomNavigationState extends BaseState with _$BottomNavigationState {
  const BottomNavigationState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}