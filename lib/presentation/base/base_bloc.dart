import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/common/error_converter.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/error_entity.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/validation_error_entity.dart';
import 'package:flutter_clean_architecture/shared/common/error_handler.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';

import 'base_state.dart';

abstract class BaseBloc<V, S extends BaseState> extends Bloc<V, S> {
  BaseBloc(S initialState) : super(initialState);

  final _messageController = StreamController<String>();
  Stream<String> get messageStream => _messageController.stream;

  final _loadingController = StreamController<bool>();
  Stream<bool> get loadingStream => _loadingController.stream;

  void handlePageLoadFailed<S>(Emitter<S> emit, Object error) {
    final errorConvert = ErrorConverter.convert(error);
    if (errorConvert is SessionExpiredErrorEntity || errorConvert is UidInvalidErrorEntity) {
      ErrorHandler.handle(errorConvert);
    }
  }

  void handleError<S>(Emitter<S> emit, Object error) {
    final message = error is ErrorEntity ? error.message : 'Error something..';
    _messageController.add(message);
  }

  // Future showSuccessDialog(
  //   String message, {
  //   VoidCallback? onPressed,
  //   bool barrierDismissible = true,
  // }) async {
  //   await AppAlertDialog.show(
  //     message: message,
  //     type: AppAlertType.success,
  //     onConfirmBtnTap: onPressed,
  //     barrierDismissible: barrierDismissible,
  //   );
  // }
  //
  // Future showConfirmDialog(
  //   String message, {
  //   VoidCallback? onConfirm,
  //   VoidCallback? onCancel,
  // }) async {
  //   await AppAlertDialog.show(
  //     message: message,
  //     type: AppAlertType.confirm,
  //     onConfirmBtnTap: onConfirm,
  //     onCancelBtnTap: onCancel,
  //   );
  // }
  //
  // Future showAlertDialog(String message, {VoidCallback? onPressed}) async {
  //   await AppAlertDialog.show(
  //     message: message,
  //     type: AppAlertType.info,
  //     onConfirmBtnTap: onPressed,
  //   );
  // }
  //
  // Future showErrorDialog(String message, {VoidCallback? onPressed}) {
  //   return AppAlertDialog.show(
  //     message: message,
  //     type: AppAlertType.error,
  //     onConfirmBtnTap: onPressed,
  //   );
  // }
  //
  void showLoading() {
    logger.d("Show loading");
    _loadingController.add(true);
    // AppAlertDialog.show(
    //   type: AppAlertType.loading,
    //   barrierDismissible: false,
    // );
  }

  void hideLoading() {
    logger.d("Hide loading");
    _loadingController.add(false);
    // AppAlertDialog.hide();
  }

  @override
  Future<void> close() {
    _messageController.close();
    _loadingController.close();
    return super.close();
  }
}