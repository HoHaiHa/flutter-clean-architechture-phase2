import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/current_user.dart';
import 'package:flutter_clean_architecture/domain/usecases/edit_profile_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_current_user_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


import '../../../../shared/common/error_converter.dart';
import '../../../../shared/common/error_entity/error_entity.dart';
import '../../../../shared/common/error_entity/validation_error_entity.dart';
import '../../../../shared/common/validation_model.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';


part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';


@injectable
class EditProfileBloc extends BaseBloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._getCurrentUserUseCase, this._editProfileUseCase) : super(const EditProfileState()) {
    on<EditProfileEvent>((event, emit) async {
      try {
        switch(event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            final CurrentUser currentUser = await _getCurrentUserUseCase.call(params: GetCurrentUserParam());
            emit(state.copyWith(username: currentUser.username,imagePath: currentUser.imagePath));
            break;
          case _ChangeFullname(fullname: final newFullname):
            emit(state.copyWith(fullname: state.fullname.copyWith(newFullname)));
            break;
          case _ChangeEmail(email: final newEmail):
            emit(state.copyWith(email: state.email.copyWith(newEmail)));
            break;
          case _ChangePhone(phone: final newPhone):
            emit(state.copyWith(phone: state.phone.copyWith(newPhone)));
            break;
          case _ChangeBio(bio:final newBio):
            emit(state.copyWith(bio: state.bio.copyWith(newBio)));
            break;
          case _ChangeWebsite(website:final newWebsite):
            emit(state.copyWith(website: state.website.copyWith(newWebsite)));
            break;
          case _PressAddImage(imagePath:final newsImagePath):
            emit(state.copyWith(imagePath: newsImagePath));
            break;
          case _PressSave():
          //logger.d(state.fullname);
            await _editProfileUseCase.call(params: EditProfileParam(state.fullname, state.email, state.phone, state.bio, state.website, state.imagePath??''));
            break;
        }
      } catch(e,s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final EditProfileUseCase _editProfileUseCase;


  @override
  void handleError<S>(Emitter<S> emit, Object error) {
    if (error is ValidationErrorEntity) {
      if (error.key == EDIT_FULLNAME) {
        emit(
          state.copyWith(fullname: state.fullname.copyWithError(error.message) )
          as S,
        );
      }
      if (error.key == EDIT_EMAIL) {
        emit(
          state.copyWith(email: state.email.copyWithError(error.message))
          as S,
        );
      }
      if (error.key == EDIT_PHONE) {
        emit(
          state.copyWith(phone: state.phone.copyWithError(error.message))
          as S,
        );
      }if (error.key == EDIT_BIO) {
        emit(
          state.copyWith(bio: state.bio.copyWithError(error.message))
          as S,
        );
      }if (error.key == EDIT_WEBSITE) {
        emit(
          state.copyWith(website: state.website.copyWithError(error.message))
          as S,
        );
      }
    } else {
      final message =
      error is ErrorEntity ? error.message : 'Error something..';


      // logger.d("duc.trandinh Has error $message");
      // emit(state.copyWith(error: message) as S);
    }
  }
}
