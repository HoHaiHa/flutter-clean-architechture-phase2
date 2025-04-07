import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_button.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_checkbox.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_secure_form_field.dart';
import 'package:flutter_clean_architecture/shared/common/validation_model.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

import '../../../../shared/utils/alert.dart';
import '../../../../shared/utils/logger.dart';
import '../../../base/base_page.dart';
import '../../../router/router.dart';
import 'login_bloc.dart';

@RoutePage()
class LoginPage extends BasePage<LoginBloc, LoginEvent, LoginState> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<LoginBloc>().add(const LoginEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (preState, state) {
        return preState.error != state.error && state.error != null;
      },
      listener: (context, state) {
        logger.d('duc.trandinh show error');
        AppAlertDialog.show(
          context: context,
          title: 'error.message'.tr(),
          message: state.error,
          type: AppAlertType.error,
          onConfirmBtnTap: () {},
          barrierDismissible: false,
        );
      },
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (preState, state) => preState.isLoading != state.isLoading,
        listener: (context, state) {
          if (state.isLoading) {
            showLoadingDialog(context);
          } else {
            hideLoadingDialog(context);
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  right: 24,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: textTheme?.textDisplayLargeBold?.copyWith(
                        color: colorSchema?.grayscaleTitleactive,
                      ),
                    ),
                    Text(
                      'Again!',
                      style: textTheme?.textDisplayLargeBold?.copyWith(
                        color: colorSchema?.primaryDefault,
                      ),
                    ),
                    Text(
                      'Welcome back you’ve \nbeen missed',
                      style: textTheme?.textLarge?.copyWith(
                        color: colorSchema?.grayscaleBodyText,
                      ),
                    ),
                    const SizedBox(height: 48),

                    BlocSelector<
                      LoginBloc,
                      LoginState,
                      ValidationModel<String>
                    >(
                      selector: (state) => state.username,
                      builder: (context, state) {
                        return Column(
                          children: [
                            AppFormField(
                              label: 'Username',
                              isRequire: true,
                              value: state.value,
                              onChanged: (value) {
                                context.read<LoginBloc>().add(
                                  LoginEvent.changeUsername(value),
                                );
                              },
                              decoration: InputDecoration(
                                errorText: state.error,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    BlocSelector<
                      LoginBloc,
                      LoginState,
                      ValidationModel<String>
                    >(
                      selector: (state) => state.password,
                      builder: (context, state) {
                        return Column(
                          children: [
                            AppSecureFormField(
                              label: 'Password',
                              isRequired: true,
                              value: state.value,
                              onChanged: (value) {
                                context.read<LoginBloc>().add(
                                  LoginEvent.changePassword(value),
                                );
                              },
                              decoration: InputDecoration(
                                errorText: state.error,
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<LoginBloc>().add(
                              const LoginEvent.toggleRemember(),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BlocSelector<LoginBloc, LoginState, bool>(
                                selector: (state) => state.isRemember,
                                builder: (context, isRemember) {
                                  return AppCheckBox(
                                    borderColor: colorSchema?.grayscaleBodyText,
                                    size: CheckBoxSize.normal,
                                    value: isRemember,
                                    checkedColor: colorSchema?.primaryDefault,
                                    onChanged: (value) {
                                      context.read<LoginBloc>().add(
                                        const LoginEvent.toggleRemember(),
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(width: 1.5),
                              Text(
                                'Remember me',
                                style: textTheme?.textSmall?.copyWith(
                                  color: colorSchema?.grayscaleBodyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Forgot the password ?',
                          style: TextStyle(
                            fontSize: 14,
                            height: 21 / 14,
                            color: Color(0xFF5890FF),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    BlocListener<LoginBloc, LoginState>(
                      listenWhen: (previousState, state) {
                        return previousState.isLoginSuccess !=
                                state.isLoginSuccess &&
                            state.isLoginSuccess == true;
                      },
                      listener: (context, state) {
                        context.replaceRoute(const HomeRoute());
                      },
                      child: AppButton.primary(
                        height: 50,
                        backgroundColor: colorSchema?.primaryDefault,
                        title: 'Login',
                        titleStyle: textTheme?.textMediumLink,
                        onPressed:
                            () => {
                              context.read<LoginBloc>().add(
                                const LoginEvent.login(),
                              ),
                            },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'or continue with',
                        style: textTheme?.textSmall?.copyWith(
                          color: colorSchema?.grayscaleBodyText,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppButton.primary(
                            height: 48,
                            backgroundColor:
                                colorSchema?.grayscaleSecondaryButton,
                            title: 'Facebook',
                            titleStyle: textTheme?.textMediumLink?.copyWith(
                              color: colorSchema?.grayscaleButtonText,
                            ),
                            onPressed: () {},
                            icon: Assets.icons.facebook.svg(),
                          ),
                        ),
                        const SizedBox(width: 31),
                        Expanded(
                          child: AppButton.primary(
                            backgroundColor:
                                colorSchema?.grayscaleSecondaryButton,
                            title: 'Google',
                            titleStyle: textTheme?.textMediumLink?.copyWith(
                              color: colorSchema?.grayscaleButtonText,
                            ),
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginEvent.pressGoogleLogin());
                            },
                            icon: Assets.icons.google.svg(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'don\'t have an account ? ',
                          style: textTheme?.textSmall?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),
                        ),
                        Text(
                          'Sign Up',
                          style: textTheme?.textSmallLink?.copyWith(
                            color: colorSchema?.primaryDefault,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
