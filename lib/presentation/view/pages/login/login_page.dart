import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_button.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_checkbox.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_secure_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

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

    return Scaffold(
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
              Row(
                children: [
                  Text(
                    'Username',
                    style: textTheme?.textSmall?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                  ),
                  Text(
                    '*',
                    style: textTheme?.textSmall?.copyWith(
                      color: colorSchema?.errorDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              BlocSelector<LoginBloc, LoginState, (String, String?)>(
                selector: (state) => (state.username, state.usernameError),
                builder: (context, state) {
                  return Column(
                    children: [
                      AppFormField(
                        value: state.$1,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                            LoginEvent.changeUsername(value),
                          );
                        },
                        decoration: InputDecoration(
                          errorText: state.$2,
                          suffixIcon: InkWell(
                            onTap: () {
                              context.read<LoginBloc>().add(
                                LoginEvent.changeUsername(''),
                              );
                            },
                            child:
                                state.$1 != ''
                                    ? Assets.icons.closeSearch.svg()
                                    : SizedBox(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Password',
                    style: textTheme?.textSmall?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                  ),
                  Text(
                    '*',
                    style: textTheme?.textSmall?.copyWith(
                      color: colorSchema?.errorDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previousState, state) {
                  return previousState.password != state.password;
                },
                builder: (context, state) {
                  return AppSecureFormField(
                    value: state.password,
                    decoration: InputDecoration(errorText: state.passwordError),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                        LoginEvent.changePassword(value),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,

                        child: BlocSelector<LoginBloc, LoginState, bool>(
                          selector: (state) => state.isRemember,
                          builder: (context, isRemember) {
                            return AppCheckBox(
                              borderColor: colorSchema?.grayscaleBodyText,
                              size: CheckBoxSize.normal,
                              value: isRemember,
                              checkedColor: colorSchema?.primaryDefault,
                              onChanged: (value) {
                                context.read<LoginBloc>().add(
                                  LoginEvent.toggleRemember(),
                                );
                              },
                            );
                          },
                        ),
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
                  return previousState.isAuthen != state.isAuthen &&
                      state.isAuthen == true;
                },
                listener: (context, state) {
                  context.replaceRoute(HomeRoute());
                },
                child: AppButton.primary(
                  height: 50,
                  backgroundColor: colorSchema?.primaryDefault,
                  title: 'Login',
                  titleStyle: textTheme?.textMediumLink,
                  onPressed:
                      () => {
                        context.read<LoginBloc>().add(const LoginEvent.login()),
                      },
                ),
              ),
              BlocListener<LoginBloc, LoginState>(
                listenWhen: (previousState, state) {
                  return previousState.isLoading != state.isLoading;
                },
                listener: (context, state) {
                  if (state.isLoading) showLoadingDialog(context);
                  if (!state.isLoading)
                    Navigator.of(context, rootNavigator: true).pop();
                  if (state.isAuthen == false) {
                    showWrongPasswordDialog(context);
                    context.read<LoginBloc>().add(
                      const LoginEvent.changeAuth(null),
                    );
                  }
                },
                child: const SizedBox.shrink(),
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
                      backgroundColor: colorSchema?.grayscaleSecondaryButton,
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
                      backgroundColor: colorSchema?.grayscaleSecondaryButton,
                      title: 'Google',
                      titleStyle: textTheme?.textMediumLink?.copyWith(
                        color: colorSchema?.grayscaleButtonText,
                      ),
                      onPressed: () {},
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
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(child: CircularProgressIndicator()),
      );
    },
  );
}

void showWrongPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Đã có lỗi xảy ra"),
        content: Text("Sai tên đăng nhập hoặc mật khẩu!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Quay lại"),
          ),
        ],
      );
    },
  );
}
