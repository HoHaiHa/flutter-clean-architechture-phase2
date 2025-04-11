part of 'main_wrapper_page_bloc.dart';

@freezed
sealed class MainWrapperPageEvent with _$MainWrapperPageEvent {
  const factory MainWrapperPageEvent.loadData() = _LoadData;
}