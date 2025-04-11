part of 'main_wrapper_page_bloc.dart';

@freezed
class MainWrapperPageState extends BaseState with _$MainWrapperPageState {
  const MainWrapperPageState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}