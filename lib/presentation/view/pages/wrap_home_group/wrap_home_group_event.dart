part of 'wrap_home_group_bloc.dart';

@freezed
sealed class WrapHomeGroupEvent with _$WrapHomeGroupEvent {
  const factory WrapHomeGroupEvent.loadData() = _LoadData;
}