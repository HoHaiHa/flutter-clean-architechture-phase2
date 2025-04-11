import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'wrap_home_group_bloc.freezed.dart';
part 'wrap_home_group_event.dart';
part 'wrap_home_group_state.dart';

@injectable
class WrapHomeGroupBloc extends BaseBloc<WrapHomeGroupEvent, WrapHomeGroupState> {
  WrapHomeGroupBloc() : super(const WrapHomeGroupState()) {
    on<WrapHomeGroupEvent>((event, emit) async {
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