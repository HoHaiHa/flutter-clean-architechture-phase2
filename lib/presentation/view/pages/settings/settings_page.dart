import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_switch.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import '../../../bloc/theme/theme_bloc.dart';
import 'settings_bloc.dart';

@RoutePage()
class SettingsPage
    extends BasePage<SettingsBloc, SettingsEvent, SettingsState> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<SettingsBloc>().add(const SettingsEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor =Theme.of(context).iconTheme.color;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.transparent,
          leading: IconButton(
            padding: EdgeInsets.only(left: 16),
            onPressed: context.pop,
            icon: Assets.icons.backIcon.svg(color: iconColor),
          ),
          title: Text(
            "Settings",
            style: textTheme?.textMedium?.copyWith(
              color: colorSchema?.darkBlack,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Assets.icons.iconNotificationTypeOutline.svg(color: colorSchema?.iconWhite),
                    Gap(4),
                    Text(
                      'Notification',
                      style: textTheme?.textMedium?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    Spacer(),
                    Assets.icons.iconRightTypeOutline.svg(color: colorSchema?.iconWhite),
                  ],
                ),
                Gap(48),
                Row(
                  children: [
                    Assets.icons.iconLockTypeOutline.svg(color: colorSchema?.iconWhite),
                    Gap(4),
                    Text(
                      'Security',
                      style: textTheme?.textMedium?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    Spacer(),
                    Assets.icons.iconRightTypeOutline.svg(color: colorSchema?.iconWhite),
                  ],
                ),
                Gap(48),
                Row(
                  children: [
                    Assets.icons.iconQuestionTypeOutline.svg(color: colorSchema?.iconWhite),
                    Gap(4),
                    Text(
                      'Help',
                      style: textTheme?.textMedium?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    Spacer(),
                    Assets.icons.iconRightTypeOutline.svg(color: colorSchema?.iconWhite),
                  ],
                ),
                Gap(48),
                Row(
                  children: [
                    Assets.icons.iconMoonTypeOutline.svg(color: colorSchema?.iconWhite),
                    Gap(4),
                    Text(
                      'Dark Mode',
                      style: textTheme?.textMedium?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    Spacer(),
                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: 36,
                          child: AppCupertinoSwitch(
                            value: state.darkMode,
                            onChanged: (value) {
                              context.read<SettingsBloc>().add(const SettingsEvent.changeDarkMode());
                              context.read<ThemeBloc>().add(ThemeEvent.changeThemeMode(value));
                              },
                            activeTrackColor: const Color(0xff667080),
                            thumbColor: CupertinoColors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(48),
                InkWell(
                  onTap: (){
                    context.router.replaceAll([const LoginRoute()]);
                  },
                  child: Row(
                    children: [
                      Assets.icons.iconLogoutTypeOutline.svg(color: colorSchema?.iconWhite),
                      Gap(4),
                      Text(
                        'Logout',
                        style: textTheme?.textMedium?.copyWith(
                          color: colorSchema?.darkBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
