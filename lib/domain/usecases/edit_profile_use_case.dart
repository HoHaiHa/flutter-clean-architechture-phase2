import 'package:flutter_clean_architecture/data/remote/models/Request/edit_profile_request.dart';
import 'package:flutter_clean_architecture/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/error_entity.dart';
import 'package:flutter_clean_architecture/shared/common/validation_model.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class EditProfileUseCase extends UseCase<void, EditProfileParam> {
  EditProfileUseCase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<bool> call({required EditProfileParam params}) async {
    ErrorEntity? errorEntity;

    errorEntity ??= params.email.checkInputIsRequired();
    errorEntity ??= params.email.checkInputIsValidEmail();
    errorEntity ??= params.phone.checkInputIsValidPhoneNumber();
    errorEntity ??= params.phone.checkInputIsRequired();
    errorEntity ??= params.bio.checkInputIsValidLink();
    errorEntity ??= params.website.checkInputIsValidLink();
    if(errorEntity != null) {
      throw errorEntity;
    }


    final EditProfileRequest editProfileRequest = EditProfileRequest(params.imagePath, params.fullname.value ?? '', params.email.value ?? '', params.phone.value ?? '', params.bio.value ?? '', params.website.value ?? '');

    return _userRepository.editProfile(editProfileRequest);
  }
}

class EditProfileParam {
  EditProfileParam( this.fullname, this.email, this.phone, this.bio, this.website, this.imagePath);
  final String imagePath;
  final ValidationModel<String> fullname;
  final ValidationModel<String> email;
  final ValidationModel<String> phone;
  final ValidationModel<String> bio;
  final ValidationModel<String> website;
}