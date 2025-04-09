part of 'edit_profile_bloc.dart';


const EDIT_FULLNAME = 'fullname';
const EDIT_EMAIL = 'email';
const EDIT_PHONE = 'phone';
const EDIT_BIO = 'bio';
const EDIT_WEBSITE = 'website';


@freezed
class EditProfileState extends BaseState with _$EditProfileState {
  const EditProfileState( {
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.username='',
    this.fullname = const ValidationModel(EDIT_FULLNAME),
    this.email = const ValidationModel(EDIT_EMAIL),
    this.phone = const ValidationModel(EDIT_PHONE),
    this.bio = const ValidationModel(EDIT_BIO),
    this.website = const ValidationModel(EDIT_WEBSITE),
    this.imagePath,
  });


  @override
  final String username;
  @override
  final ValidationModel<String> fullname;
  @override
  final ValidationModel<String> email;
  @override
  final ValidationModel<String> phone;
  @override
  final ValidationModel<String> bio;
  @override
  final ValidationModel<String> website;
  @override
  final String? imagePath;
}


