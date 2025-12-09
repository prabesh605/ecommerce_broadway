import 'package:ecommerce_app/models/mobile_model.dart';

abstract class MobileState {}

class MobileInitial extends MobileState {}

class MobileLoading extends MobileState {}

class MobileSuccess extends MobileState {
  final List<MobileModel> mobileModel;
  MobileSuccess(this.mobileModel);
}

class MobileError extends MobileState {
  final String message;
  MobileError(this.message);
}
