part of 'detail_bloc.dart';

@freezed
sealed class DetailEvent with _$DetailEvent {
  const factory DetailEvent.loadData(String newsId) = _LoadData;
  const factory DetailEvent.changeLike() = _ChangeLike;
  const factory DetailEvent.changeSave() = _ChangeSave;
  const factory DetailEvent.changeFollow(String userName) = _ChangeFollow;
}