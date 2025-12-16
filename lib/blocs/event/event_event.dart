import 'package:ecommerce_app/models/event_model.dart';

abstract class EventEvent {}

//add
class AddEvent extends EventEvent {
  final EventModel eventModel;
  AddEvent(this.eventModel);
}

//get
class GetEvent extends EventEvent {}

//update
class UpdateEvent extends EventEvent {
  final EventModel eventModel;
  UpdateEvent(this.eventModel);
}

//delete
class DeleteEvent extends EventEvent {
  final int eventID;
  DeleteEvent(this.eventID);
}
