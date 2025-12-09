import 'package:ecommerce_app/blocs/mobile/mobile_event.dart';
import 'package:ecommerce_app/blocs/mobile/mobile_state.dart';
import 'package:ecommerce_app/models/mobile_model.dart';
import 'package:ecommerce_app/services/mobile_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileBloc extends Bloc<MobileEvent, MobileState> {
  MobileService mobileService;
  MobileBloc(this.mobileService) : super(MobileInitial()) {
    on<LoadMobileData>((event, emit) async {
      emit(MobileLoading());
      final List<MobileModel> result = await mobileService.getDatas();
      if (result.isEmpty) {
        emit(MobileError("Something went Wrong"));
      } else {
        emit(MobileSuccess(result));
      }
    });
  }
}
