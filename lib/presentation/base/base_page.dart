import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/base/page_status.dart';
import 'package:flutter_clean_architecture/shared/extension/theme_data.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../di/di.dart';
import '../../shared/utils/alert.dart';
import '../../shared/utils/keyboard.dart';
import '../view/widgets/app_list_card_loading.dart';
import '../view/widgets/error_widget.dart';
import 'base_bloc.dart';
import 'base_state.dart';

abstract class BasePage<B extends BaseBloc<E, S>, E, S extends BaseState>
    extends StatefulWidget
    implements AutoRouteWrapper {
  const BasePage({Key? key, this.screenName, this.needRemoveSplash = false})
    : super(key: key);

  final String? screenName;
  final bool needRemoveSplash;

  Widget pageLoadingBuilder(BuildContext context) {
    if (screenName == null) {
      return const _LoadingView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(screenName ?? ''),
        automaticallyImplyLeading: false,
      ),
      body: const _LoadingView(),
    );
  }

  Widget pageErrorBuilder(BuildContext context, String? pageErrorMessage) {
    final errorView = _ErrorView(
      errorMessage: pageErrorMessage,
      onRetry: () => onErrorPressed.call(context),
    );
    if (screenName == null) {
      return errorView;
    }

    return Scaffold(
      appBar: AppBar(title: Text(screenName ?? '')),
      body: errorView,
    );
  }

  Widget builder(BuildContext context);

  void onErrorPressed(BuildContext context) {}

  void onInitState(BuildContext context) {}

  void onDispose(BuildContext context) {}

  void onResume(BuildContext context) {}

  void onBuilderComplete(BuildContext context) {}

  void didChangeDependencies(BuildContext context) {}

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<B>(create: (_) => createBloc(), child: this);
  }

  B createBloc() {
    return getIt<B>();
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void hideLoadingDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  _BasePageState createState() => _BasePageState<B, E, S>();
}

class _BasePageState<B extends BaseBloc<E, S>, E, S extends BaseState>
    extends State<BasePage> {
  bool firstShowed = false;
  late VoidCallback onBuilderComplete;

  @override
  void initState() {
    super.initState();
    onBuilderComplete = () {
      widget.onBuilderComplete(context);
    };
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.onInitState(context);
    });
  }

  @override
  void dispose() {
    widget.onDispose(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextStyle =
        Theme.of(context).own().textTheme?.primary ??
        const TextStyle(fontSize: 13);
    final defaultTextStyle = primaryTextStyle.copyWith(
      color: Theme.of(context).own().colorSchema?.primary,
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: FocusDetector(
        child: DefaultTextStyle(
          style: defaultTextStyle,
          child: GestureDetector(
            onTap: () => hideKeyboard(),
            behavior: HitTestBehavior.translucent,
            child: BlocBuilder<B, S>(
              buildWhen: (pre, state) {
                return pre.pageStatus != state.pageStatus;
              },
              builder: (context, state) {
                switch (state.pageStatus) {
                  case PageStatus.Uninitialized:
                    return widget.pageLoadingBuilder(context);
                  case PageStatus.Loaded:
                    final builder = widget.builder(context);
                    onBuilderComplete.call();
                    return BlocListener<B, S>(
                      listenWhen: (preState, state) {
                        return state.pageErrorMessage !=
                                preState.pageErrorMessage;
                      },
                      listener: (context, state) {
                        logger.d('duc.trandinh show error');

                        AppAlertDialog.show(
                          context: context,
                          title: 'error.message'.tr(),
                          message: state.pageErrorMessage,
                          type: AppAlertType.error,
                          onConfirmBtnTap: () {},
                          barrierDismissible: false,
                        );
                      },
                      child: builder,
                    );

                  case PageStatus.Error:
                    return widget.pageErrorBuilder(
                      context,
                      state.pageErrorMessage,
                    );
                }
              },
            ),
          ),
        ),
        onFocusGained: () {
          if (firstShowed) {
            widget.onResume(context);
          }
          firstShowed = true;
        },
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const AppListCardLoading();
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({this.errorMessage, this.onRetry});

  final String? errorMessage;
  final Function? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AppErrorWidget(
          errorMessage: errorMessage ?? 'error.message'.tr(),
          onRetry: onRetry,
        ),
      ),
    );
  }
}
