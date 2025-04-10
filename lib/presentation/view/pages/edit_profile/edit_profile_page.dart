import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import 'edit_profile_bloc.dart';

@RoutePage()
class EditProfilePage
    extends BasePage<EditProfileBloc, EditProfileEvent, EditProfileState> {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<EditProfileBloc>().add(const EditProfileEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor = Theme.of(context).iconTheme.color;
    final ImagePicker imagePicker = ImagePicker();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.transparent,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 16),
            onPressed: context.pop,
            icon: Assets.icons.iconCloseTypeOutline.svg(color: iconColor),
          ),
          title: Text(
            'Edit Profile',
            style: textTheme?.textMediumLink?.copyWith(
              color: colorSchema?.darkBlack,
            ),
          ),
          actions: [
            BlocListener<EditProfileBloc, EditProfileState>(
              listenWhen: (preState, state) {
                return !state.hasError;
              },
              listener: (context, state) {
                context.pushRoute(const ProfileRoute());
              },
              child: InkWell(
                onTap: () {
                  context.read<EditProfileBloc>().add(
                    const EditProfileEvent.pressSave(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Assets.icons.iconCheckTypeOutline.svg(
                    color: iconColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocBuilder<EditProfileBloc, EditProfileState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 140,
                            height: 140,
                            child: ClipOval(
                              child:
                                  (state.imagePicker?.path ?? '') != ''
                                      ? Image.file(
                                        File(state.imagePicker?.path ?? ''),
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Image.asset(
                                            'assets/images/default_img_user.jpg',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                      : ((state.imagePath ?? '').startsWith(
                                            'http',
                                          )
                                          ? Image.network(
                                            state.imagePath ?? '',
                                            fit: BoxFit.cover,
                                            errorBuilder: (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {
                                              return Image.asset(
                                                'assets/images/default_img_user.jpg',
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          )
                                          : Image.file(
                                            File(state.imagePath ?? ''),
                                            fit: BoxFit.cover,
                                            errorBuilder: (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {
                                              return Image.asset(
                                                'assets/images/default_img_user.jpg',
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          )),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 16,
                            child: InkWell(
                              onTap: () async {
                                final XFile? image = await imagePicker
                                    .pickImage(source: ImageSource.gallery);
                                if ((image?.path ?? '').isNotEmpty)
                                  context.read<EditProfileBloc>().add(
                                    EditProfileEvent.pressAddImage(
                                      image?.path ?? '',
                                      image,
                                    ),
                                  );
                              },
                              child: Assets.icons.iconUploadImg.svg(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(16),
                    AppFormField(
                      label: 'Username',
                      value: state.username,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: SizedBox.shrink(),
                      ),
                    ),
                    Gap(16),
                    AppFormField(
                      label: 'Full name',
                      value: state.fullname.value,
                      decoration: InputDecoration(
                        errorText: state.fullname.error,
                        suffixIcon: SizedBox.shrink(),
                      ),
                      onChanged: (value) {
                        context.read<EditProfileBloc>().add(
                          EditProfileEvent.changeFullname(value),
                        );
                      },
                    ),
                    Gap(16),
                    AppFormField(
                      label: 'Email Address',
                      isRequire: true,
                      value: state.email.value,
                      decoration: InputDecoration(
                        errorText: state.email.error,
                        suffixIcon: SizedBox.shrink(),
                      ),
                      onChanged: (value) {
                        context.read<EditProfileBloc>().add(
                          EditProfileEvent.changeEmail(value),
                        );
                      },
                    ),
                    Gap(16),
                    AppFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9+\-() ]'),
                        ),
                      ],
                      label: 'Phone number',
                      isRequire: true,
                      value: state.phone.value,
                      decoration: InputDecoration(
                        errorText: state.phone.error,
                        suffixIcon: SizedBox.shrink(),
                      ),
                      onChanged: (value) {
                        context.read<EditProfileBloc>().add(
                          EditProfileEvent.changePhone(value),
                        );
                      },
                    ),
                    Gap(16),
                    AppFormField(
                      label: 'Bio',
                      value: state.bio.value,
                      decoration: InputDecoration(
                        errorText: state.bio.error,
                        suffixIcon: SizedBox.shrink(),
                      ),
                      onChanged: (value) {
                        context.read<EditProfileBloc>().add(
                          EditProfileEvent.changeBio(value),
                        );
                      },
                    ),
                    Gap(16),
                    AppFormField(
                      label: 'Website',
                      value: state.website.value,
                      decoration: InputDecoration(
                        errorText: state.website.error,
                        suffixIcon: SizedBox.shrink(),
                      ),
                      onChanged: (value) {
                        context.read<EditProfileBloc>().add(
                          EditProfileEvent.changeWebsite(value),
                        );
                      },
                    ),
                    Gap(16),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
