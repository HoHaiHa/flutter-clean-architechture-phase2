import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import 'detail_bloc.dart';

@RoutePage()
class DetailPage extends BasePage<DetailBloc, DetailEvent, DetailState> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<DetailBloc>().add(const DetailEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: context.pop,
          icon: Assets.icons.backIcon.svg(),
        ),
        actions: [
          IconButton(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Assets.icons.iconShareTypeOutline.svg(),
          ),
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            icon: Assets.icons.iconMoreVerTypeOutline.svg(), // Icon dấu "..."
            onSelected: (value) {
              print("Selected: $value");
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(value: "Settings", child: Text("Settings")),
                  PopupMenuItem(value: "Logout", child: Text("Logout")),
                ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(16),

          ],
        ),
      ),
    );
  }
}
