import 'package:ecommerce_app/models/event_model.dart';

abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventError extends EventState {
  final String message;

  EventError(this.message);
}

class LoadEvents extends EventState {
  final List<EventModel> list;
  LoadEvents(this.list);
}

class StreamEvents extends EventState {
  final Stream<List<EventModel>>? list;
  StreamEvents(this.list);
}

class UpdateEventSucess extends EventState {}
