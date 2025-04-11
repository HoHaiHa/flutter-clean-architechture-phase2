import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_page.dart';
import 'wrap_home_group_bloc.dart';

@RoutePage()
class WrapHomeGroupPage extends BasePage<WrapHomeGroupBloc, WrapHomeGroupEvent, WrapHomeGroupState> {
  const WrapHomeGroupPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<WrapHomeGroupBloc>().add(const WrapHomeGroupEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return const AutoRouter();
  }
}