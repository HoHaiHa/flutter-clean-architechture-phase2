part of 'detail_bloc.dart';

@freezed
sealed class DetailEvent with _$DetailEvent {
  const factory DetailEvent.loadData() = _LoadData;
  const factory DetailEvent.changeFollow() = _ChangeFollow;
  const factory DetailEvent.changeSave() = _ChangeSave;
  const factory DetailEvent.changeLike() = _ChangeLike;
}