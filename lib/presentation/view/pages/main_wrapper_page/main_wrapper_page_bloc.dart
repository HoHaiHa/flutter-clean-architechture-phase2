import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'main_wrapper_page_bloc.freezed.dart';
part 'main_wrapper_page_event.dart';
part 'main_wrapper_page_state.dart';

@injectable
class MainWrapperPageBloc extends BaseBloc<MainWrapperPageEvent, MainWrapperPageState> {
  MainWrapperPageBloc() : super(const MainWrapperPageState()) {
    on<MainWrapperPageEvent>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              break;
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
}