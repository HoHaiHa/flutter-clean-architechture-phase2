import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';

import '../../../base/base_page.dart';
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
    return Center(
      child: Switch(
        value: true,
        onChanged: (value) {
          logger.d(value);
        },
      ),
    );
  }
}
