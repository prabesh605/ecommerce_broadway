import 'package:ecommerce_app/models/event_model.dart';

abstract class EventEvent {}

//add
class AddEvent extends EventEvent {
  final ProductModel eventModel;
  AddEvent(this.eventModel);
}

//get
class GetEvent extends EventEvent {}

class GetStream extends EventEvent {}

//update
class UpdateEvent extends EventEvent {
  final ProductModel eventModel;
  UpdateEvent(this.eventModel);
}

//delete
class DeleteEvent extends EventEvent {
  final String eventID;
  DeleteEvent(this.eventID);
}
