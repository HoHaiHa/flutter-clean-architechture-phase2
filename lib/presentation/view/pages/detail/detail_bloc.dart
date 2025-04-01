import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/news.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'detail_bloc.freezed.dart';
part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends BaseBloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState()) {
    on<DetailEvent>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              break;
            case _ChangeFollow():
              // TODO: Handle this case.
              throw UnimplementedError();
            case _ChangeSave():
              // TODO: Handle this case.
              throw UnimplementedError();
            case _ChangeLike():
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
}