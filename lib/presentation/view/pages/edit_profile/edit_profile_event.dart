part of 'edit_profile_bloc.dart';


@freezed
sealed class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.loadData() = _LoadData;
  const factory EditProfileEvent.changeFullname(String fullname) = _ChangeFullname;
  const factory EditProfileEvent.changeEmail(String email) = _ChangeEmail;
  const factory EditProfileEvent.changePhone(String phone) = _ChangePhone;
  const factory EditProfileEvent.changeBio(String bio) = _ChangeBio;
  const factory EditProfileEvent.changeWebsite(String website) = _ChangeWebsite;
  const factory EditProfileEvent.pressAddImage(String imagePath) = _PressAddImage;
  const factory EditProfileEvent.pressSave() = _PressSave;
}